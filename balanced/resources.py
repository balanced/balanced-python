import itertools
import re
import logging
import urlparse

from utils import cached_property, url_encode, classproperty


LOGGER = logging.getLogger(__name__)


_RE_ALLOWED_LITERALS = re.compile(r'[\w]+$')


class _ResourceRegistry(dict):

    def add(self, resource_class):
        self[resource_class.__name__] = resource_class
        self[resource_class.RESOURCE['singular']] = resource_class
        self[resource_class.RESOURCE['collection']] = resource_class

    def from_uri(self, uri):
        if not uri:
            return None

        split_uri = urlparse.urlsplit(uri.rstrip('/'))
        url = split_uri.path.split('/')  # pylint: disable-msg=E1103
        if _RE_ALLOWED_LITERALS.match(url[-1]):
            resource = self[url[-1]]
        else:
            resource = self[url[-2]]
        return resource


_RESOURCES = _ResourceRegistry()


class ResourceError(Exception):
    pass


class NoResultFound(Exception):
    pass


class MultipleResultsFound(Exception):
    pass


class Page(object):

    def __init__(self, uri):
        self._resource = _RESOURCES.from_uri(uri)
        self.uri = uri
        self.qs = {}

    def __getitem__(self, item):
        if isinstance(item, slice):
            start, stop, step = item.start, item.stop, item.step

            if all((isinstance(stop, int),
                    isinstance(start, int),
                    stop - start <= 0)):
                return []

            elif any((isinstance(start, int) and start < 0,
                     isinstance(stop, int) and stop < 0)):
                return self.all()[item]

            res = self._slice(start, stop)
            if step is not None:
                return list(res)[None:None:item.step]
            else:
                return list(res)
        else:
            return list(self[item:item + 1])[0]

    def _slice(self, start, stop):
        if start is not None and stop is not None:
            self.qs['offset'] = (self.offset or 0) + start
            self.qs['limit'] = stop - start
        elif start is None and stop is not None:
            self.qs['limit'] = stop
        elif start is not None and stop is None:
            self.qs['offset'] = (self.offset or 0) + start
        return self

    @classmethod
    def from_uri_and_params(cls, uri, params):
        parsed_uri = urlparse.urlparse(uri)
        parsed_qs = urlparse.parse_qs(parsed_uri.query)
        if params and isinstance(params, (dict, )):
            parsed_qs.update(params)
        uri = parsed_uri.path + '?' + url_encode(parsed_qs)
        return cls(uri)

    def __repr__(self):
        return '<Page{}{}>'.format(self._resource, self.qs)

    def all(self):
        return list(self)

    def one(self):
        ret = list(self[0:2])

        if len(ret) == 1:
            return ret[0]
        elif len(ret) == 0:
            raise NoResultFound(
                'Nothing found for one(). Make sure balanced.configure() '
                'is invoked with your API key secret')
        else:
            raise MultipleResultsFound('Multiple items were found for one()')

    @cached_property
    def _lazy_loaded(self):
        page = self._fetch(self.uri)
        response = self._resource.http_client.get(page.uri)
        return response.deserialized

    def _fetch(self, uri):
        if not uri:
            return []
        return Page.from_uri_and_params(uri, self.qs)

    @property
    def items(self):
        return (self._resource(**item) for item in self._lazy_loaded['items'])

    @property
    def total(self):
        return self._lazy_loaded['total']

    def count(self):
        self.qs['offset'] = 0
        self.qs['limit'] = 0
        return self._fetch(self.uri).total

    @property
    def offset(self):
        return self._lazy_loaded['offset']

    @property
    def limit(self):
        return self._lazy_loaded['limit']

    def filter(self, **query_arguments):
        """
        Allows query string filters to be passed down as keyword arguments
        for easier filtering:

          credits = marketplace.credits.filter(limit=10)
          for c in credits:
              ....

        """
        self.qs.update(query_arguments)
        return self._fetch(self.uri)

    @property
    def next_page(self):
        uri = self._lazy_loaded['next_uri']
        return self._fetch(uri)

    @property
    def last_page(self):
        uri = self._lazy_loaded['last_uri']
        return self._fetch(uri)

    @property
    def first_page(self):
        uri = self._lazy_loaded['first_uri']
        return self._fetch(uri)

    @property
    def previous_page(self):
        uri = self._lazy_loaded['previous_uri']
        return self._fetch(uri)

    def __iter__(self):
        for resource in itertools.chain(self.items, self.next_page):
            yield resource


class Resource(object):

    #: http_client is the class variable representing a
    #: :class:`~balanced.http_client.HTTPClient`
    http_client = None

    def __repr__(self):
        attrs = ', '.join(['%s=%s' % (k, repr(v)) for k, v in
                           self.__dict__.iteritems()])
        return '%s(%s)' % (self.__class__.__name__, attrs)

    @classproperty
    def query(self):
        uri = uri_discovery(self)
        return Page.from_uri_and_params(uri, params=None)

    @property
    def id(self):
        if not hasattr(self, 'uri') or is_collection(self.uri):
            return None
        return self.uri.rpartition('/')[-1]

    @classmethod
    def find(cls, uri, **kwargs):
        resp = cls.http_client.get(uri, **kwargs)
        return cls(**resp.deserialized)

    def save(self):
        instance_attributes = self.__dict__.copy()

        uri = instance_attributes.pop('uri', None)
        if not uri:
            uri = self.RESOURCE['collection']

        for key, value in instance_attributes.items():
            if isinstance(value, Resource):
                instance_attributes.pop(key)

        http_method = 'put' if self.id else 'post'
        method = getattr(self.http_client, http_method)

        resource = method(uri, data=instance_attributes)
        new_klass = self.__class__(**resource.deserialized)
        self.__dict__.update(new_klass.__dict__)
        return self

    def delete(self):
        self.http_client.delete(self.uri)


def uri_discovery(resource):
    uri = resource.RESOURCE['collection']
    if resource.RESOURCE['resides_under_marketplace']:
        uri = '{}/{}'.format(
            Marketplace.my_marketplace.uri,
            resource.RESOURCE['collection']
            )
    return uri


def is_collection(uri):
    _, _, end_identifier = uri.rstrip('/').rpartition('/')
    return _RE_ALLOWED_LITERALS.match(end_identifier)


def from_uri(cls, uri, **kwargs):
    if is_collection(uri):
        return cls.query.filter(**kwargs)
    else:
        return cls.find(uri, **kwargs)


def is_subresource(value):
    return isinstance(value, dict) and 'uri' in value


def is_uri(key):
    return isinstance(key, basestring) and key.endswith('_uri')


def make_constructor():
    """Makes an initializer constructor that decends
    recursively into all schema specified for sub resources.

    """

    def make_property(class_instance, key, uri, resource):

        def closure(_):
            return from_uri(resource, uri)

        setattr(class_instance.__class__, key, cached_property(closure))

    def the_init(cls, **kwargs):
        # iterate through the schema that comes back
        for key, value in kwargs.iteritems():
            if is_subresource(value):
                # sub resources have a uri in them
                uri = value['uri']
                try:
                    resource = _RESOURCES.from_uri(uri)
                except KeyError:
                    LOGGER.warning(
                        "Unknown resource '%s'. Make sure it is "
                        "added in resources.py. Defaulting to dictionary "
                        "based access", key)
                else:
                    value = resource(**value)
            elif is_uri(key):
                new_key = key.replace('_uri', '')
                try:
                    resource = _RESOURCES.from_uri(value)
                except KeyError:
                    LOGGER.warning(
                        "Unknown resource '%s' for '%s'. Make sure it is "
                        "added in resources.py.", new_key, value)
                else:
                    make_property(cls, new_key, value, resource)

            setattr(cls, key, value)

        if not hasattr(cls, 'uri'):
            if cls.RESOURCE['resides_under_marketplace']:
                uri = '{}/{}'.format(
                    Marketplace.my_marketplace.uri,
                    cls.RESOURCE['collection'])
                cls.uri = uri

    return the_init


def resource_base(singular=None,
                  collection=None,
                  metadata=None,
                  resides_under_marketplace=True):

    class Base(type):

        def __new__(mcs, classname, bases, clsdict):
            clsdict.update({
                'RESOURCE': metadata or {
                    'singular': singular or classname.lower(),
                    'collection': collection,
                    'resides_under_marketplace': resides_under_marketplace,
                },
                '__init__': make_constructor(),
                })

            the_class = type.__new__(mcs, classname, bases, clsdict)
            _RESOURCES.add(the_class)
            return the_class

    return Base


class Account(Resource):
    __metaclass__ = resource_base(collection='accounts')

    def debit(self, amount=None, appears_on_statement_as=None,
              authorization_uri=None, meta=None, description=None):
        if not any((amount, authorization_uri)):
            raise Exception('Must have an amount or authorization uri')

        meta = meta or {}
        return Debit(
            uri=self.debits_uri,
            amount=amount,
            appears_on_statement_as=appears_on_statement_as,
            authorization_uri=authorization_uri,
            meta=meta,
            description=description,
        ).save()

    def authorize(self, amount, meta=None):
        meta = meta or {}
        return Authorization(
            uri=self.authorizations_uri,
            amount=amount,
            meta=meta
        ).save()

    def credit(self, amount, description=None, meta=None):
        meta = meta or {}
        return Credit(
            uri=self.credits_uri,
            amount=amount,
            meta=meta,
            description=description,
        ).save()


class Marketplace(Resource):
    __metaclass__ = resource_base(
        collection='marketplaces',
        resides_under_marketplace=False)

    @classproperty
    def my_marketplace(self):
        return Merchant.query.one().marketplace

    def create_buyer(self, email_address, credit_card, name=None, meta=None):
        meta = meta or {}
        return Account(
            uri=self.accounts_uri,
            email_address=email_address,
            credit_card=credit_card,
            name=name,
            meta=meta,
        ).save()

    def create_merchant(self, email_address, merchant, bank_account=None,
                        name=None, meta=None):
        meta = meta or {}
        return Account(
            uri=self.accounts_uri,
            email_address=email_address,
            merchant=merchant,
            bank_account=bank_account,
            name=name,
            meta=meta,
        ).save()


class Debit(Resource):
    __metaclass__ = resource_base(collection='debits')

    def refund(self, amount=None, description=None):
        return Refund(
            uri=self.refunds_uri,
            debit_uri=self.uri,
            amount=amount,
            description=description
        ).save()


class Credit(Resource):
    __metaclass__ = resource_base(collection='credits')


class Refund(Resource):
    __metaclass__ = resource_base(collection='refunds')


class Authorization(Resource):
    __metaclass__ = resource_base(collection='authorizations')

    def void(self):
        self.is_void = True
        self.save()

    def capture(self, **kwargs):
        return self.account.debit(authorization_uri=self.uri, **kwargs)


class APIKey(Resource):
    __metaclass__ = resource_base(
        singular='api_key',
        collection='api_keys',
        resides_under_marketplace=False)


class Merchant(Resource):
    __metaclass__ = resource_base(
        collection='merchants',
        resides_under_marketplace=False)

    @classproperty
    def me(self):
        return Merchant.query.one()
