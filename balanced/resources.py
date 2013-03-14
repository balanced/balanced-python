import functools
import itertools
import logging
import urlparse
import warnings

import iso8601

from balanced.utils import cached_property, url_encode, classproperty
from balanced.exc import NoResultFound, MultipleResultsFound, ResourceError


LOGGER = logging.getLogger(__name__)


class _ResourceRegistry(dict):

    def add(self, resource_class):
        self[resource_class.__name__] = resource_class
        self[resource_class.RESOURCE['singular']] = resource_class
        self[resource_class.RESOURCE['collection']] = resource_class
        if resource_class.RESOURCE['nested_under']:
            # nested_as = ['marketplaces', 'events']
            # collection = 'logs'
            # store nested_under as |marketplaces/events/logs
            nested_under = self._as_nested(
                resource_class.RESOURCE['nested_under'] + [
                    resource_class.RESOURCE['collection']
                ]
            )
            self[nested_under] = resource_class

    def from_uri(self, uri):
        if not uri:
            return None

        split_uri = urlparse.urlsplit(uri.rstrip('/'))
        # split_uri.path == '/v1/marketplaces/M123/events/E123'
        # url == ['', 'v1', 'marketplaces', 'M123', 'events', 'E123']
        url = split_uri.path.split('/')  # pylint: disable-msg=E1103

        resource = self._from_nested(url) or self._from_url(url)

        return resource

    def _from_url(self, url_parts):
        if url_parts[-1] in self:
            resource = self[url_parts[-1]]
        else:
            resource = self[url_parts[-2]]
        return resource

    def _from_nested(self, url_parts):
        # ['marketplaces', 'events']
        parts = url_parts[2::2]
        # we have a possible nested resource, check if it's specifically nested
        if len(parts) > 1:
            nested = self._as_nested(parts)
            if nested in self:
                resource = self[nested]
                return resource
        return None

    def _as_nested(self, parts):
        """
        >>> _ResourceRegistry()._as_nested(['marketplaces', 'events'])
        '|marketplaces/events'
        :param parts: list of parts to turn into a nested resource
        :return: munged fungible
        """
        return '|' + '/'.join(parts)


_RESOURCES = _ResourceRegistry()


class Page(object):

    def __init__(self, uri):
        self.uri = uri
        self.qs = {}

    def __getitem__(self, item):
        if isinstance(item, slice):
            start, stop, step = item.start, item.stop, item.step

            # can't use all() here because it doesnt
            # fail fast.
            if (isinstance(stop, int) and
                isinstance(start, int) and
                    stop - start <= 0):
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
            # negative index
            if item < 0:
                # e.g. let len(self) = 3 and item = -1
                # self[length of collection - item : length of collection]
                # self[3 - 1: 3]
                length = len(self)
                return list(self[length + item:length])[0]
            # positive index
            # let item = 2
            # self[2:3][0]
            return list(self[item:item + 1])[0]

    def _slice(self, start, stop):
        if start is not None and stop is not None:
            self.qs['offset'] = (self.offset or 0) + start
            self.qs['limit'] = stop - start
        elif stop is not None:
            self.qs['limit'] = stop
        elif start is not None:
            self.qs['offset'] = (self.offset or 0) + start
        return itertools.islice(self, start, stop)

    def __len__(self):
        return self.total

    def __iter__(self):
        if self.next_page is not None:
            for resource in itertools.chain(self.items, self.next_page):
                yield resource
        else:
            # New-style, no pagination
            for resource in self.items:
                yield resource

    @classmethod
    def from_uri_and_params(cls, uri, params):
        parsed_uri = urlparse.urlparse(uri)
        parsed_qs = urlparse.parse_qs(parsed_uri.query)
        if params and isinstance(params, (dict, )):
            parsed_qs.update(params)
        uri = parsed_uri.path
        if parsed_qs:
            uri = uri + '?' + url_encode(parsed_qs)
        return cls(uri)

    @classmethod
    def from_response(cls, uri, **kwargs):
        instance = cls.from_uri_and_params(uri, None)
        setattr(instance, '_lazy_loaded', kwargs)
        return instance

    def __repr__(self):
        _resource = _RESOURCES.from_uri(self.uri)
        return '<Page{0}{1}>'.format(_resource, self.qs)

    def all(self):
        return list(self)

    def one(self):
        ret = list(self[0:2])

        if len(ret) == 1:
            return ret[0]
        elif not len(ret):
            raise NoResultFound(
                'Nothing found for one(). Make sure balanced.configure() '
                'is invoked with your API key secret')
        else:
            raise MultipleResultsFound('Multiple items were found for one()')

    @cached_property
    def _lazy_loaded(self):
        page = self._fetch(self.uri)
        response = Resource.http_client.get(page.uri)
        return response.deserialized

    def _fetch(self, uri):
        if not uri:
            return []
        return Page.from_uri_and_params(uri, self.qs)

    @property
    def items(self):
        for item in self._lazy_loaded['items']:
            _resource = _RESOURCES.from_uri(item['uri'])
            yield _resource(**item)

    @property
    def total(self):
        return self._lazy_loaded['total']

    def count(self):
        copied_dict = self.qs.copy()
        copied_dict['offset'] = 0
        copied_dict['limit'] = 1
        return Page.from_uri_and_params(self.uri, copied_dict).total

    @property
    def offset(self):
        return self._lazy_loaded['offset']

    @property
    def limit(self):
        return self._lazy_loaded['limit']

    @property
    def next_page(self):
        if 'next_uri' in self._lazy_loaded:
            uri = self._lazy_loaded['next_uri']
            return self._fetch(uri)
        return None

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

    def filter(self, *args, **kwargs):
        """
        Allows query string filters to be passed down as keyword arguments
        for easier filtering:

          credits = marketplace.credits.filter(limit=10)
          for c in credits:
              ....

        """
        query_arguments = {}
        for expression in args:
            if not isinstance(expression, FilterExpression):
                raise ValueError('"{0}" is not a FilterExpression'.format(
                    expression))
            if expression.op == '=':
                f = '{0}'.format(expression.field.name)
            else:
                f = '{0}[{1}]'.format(expression.field.name, expression.op)
            values = expression.value
            if not isinstance(values, (list, tuple)):
                values = [values]
            query_arguments[f] = ','.join(str(v) for v in values)
        for k, values in kwargs.iteritems():
            f = '{0}'.format(k)
            if not isinstance(values, (list, tuple)):
                values = [values]
            v = ','.join(str(v) for v in values)
            query_arguments[f] = v
        qs = self.qs.copy()
        qs.update(query_arguments)
        return Page.from_uri_and_params(self.uri, qs)

    def sort(self, *args):
        sorts = []
        for expression in args:
            if not isinstance(expression, SortExpression):
                raise ValueError('"{0}" is not a SortExpression'.format(
                    expression))
            v = '{0},{1}'.format(
                expression.field.name,
                'asc' if expression.ascending else 'desc')
            sorts.append(v)
        if 'sort' in self.qs:
            self.qs['sort'].extend(sorts)
        else:
            self.qs['sort'] = sorts
        return self


class Resource(object):

    #: http_client is the class variable representing a
    #: :class:`~balanced.http_client.HTTPClient`
    http_client = None

    def __repr__(self):
        attrs = ', '.join(['%s=%s' % (k, repr(v)) for k, v in
                           self.__dict__.iteritems()])
        return '%s(%s)' % (self.__class__.__name__, attrs)

    @classproperty
    def query(cls):
        uri = uri_discovery(cls)
        return Page.from_uri_and_params(uri, params=None)

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
        self.__dict__.clear()
        self.__dict__.update(new_klass.__dict__)
        return self

    def delete(self):
        self.http_client.delete(self.uri)


def uri_discovery(resource):
    uri = resource.RESOURCE['collection']
    if resource.RESOURCE['resides_under_marketplace']:
        uri = '{0}/{1}'.format(
            Marketplace.my_marketplace.uri,
            resource.RESOURCE['collection']
        )
    return uri


def is_collection(uri):
    uri = urlparse.urlparse(uri).path
    _, _, end_identifier = uri.rstrip('/').rpartition('/')
    return end_identifier in _RESOURCES


def from_uri(uri, **kwargs):
    resource = _RESOURCES.from_uri(uri)
    if is_collection(uri):
        return Page.from_uri_and_params(uri, params=kwargs)
    else:
        return resource.find(uri, **kwargs)


def is_subresource(value):
    return isinstance(value, dict) and 'uri' in value


def is_date(value):
    return (
        value and
        isinstance(value, basestring) and
        'Z' in value
    )


def is_uri(key):
    return isinstance(key, basestring) and key.endswith('_uri')


class _LazyURIDescriptor(object):

    def __init__(self, key):
        self.key = key

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self
        uri = getattr(obj, self.key)
        if uri is None:
            return None
        return from_uri(uri)


def make_constructors():
    """Makes an initializer constructor that decends
    recursively into all schema specified for sub resources.

    """

    def the_new(cls, **kwargs):
        for key in kwargs.iterkeys():

            if not is_uri(key):
                continue

            new_key = key.replace('_uri', '')

            if hasattr(cls, new_key):
                continue

            setattr(cls, new_key, _LazyURIDescriptor(key))

        return object.__new__(cls, **kwargs)

    def the_init(self, **kwargs):
        self.id = None

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
                    if is_collection(uri):
                        value = Page.from_response(**value)
                    else:
                        value = resource(**value)
            elif key.endswith('_at') and is_date(value):
                value = iso8601.parse_date(value)
            setattr(self, key, value)

        if not hasattr(self, 'uri'):
            self.uri = uri_discovery(self)

    return the_init, the_new


class _ResourceField(object):

    def __init__(self, name):
        self.name = name

    def __getattr__(self, name):
        return _ResourceField('{0}.{1}'.format(self.name, name))

    def asc(self):
        return SortExpression(self, ascending=True)

    def desc(self):
        return SortExpression(self, ascending=False)

    def in_(self, *args):
        return FilterExpression(self, 'in', args, '!in')

    def startswith(self, prefix):
        if not isinstance(prefix, basestring):
            raise ValueError('"startswith" prefix  must be a string')
        return FilterExpression(self, 'startswith', prefix, None)

    def endswith(self, suffix):
        if not isinstance(suffix, basestring):
            raise ValueError('"endswith" suffix  must be a string')
        return FilterExpression(self, 'endswith', suffix, None)

    def contains(self, fragment):
        if not isinstance(fragment, basestring):
            raise ValueError('"contains" fragment must be a string')
        return FilterExpression(self, 'contains', fragment, '!contains')

    def __lt__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('"<" operand must be a single value')
        return FilterExpression(self, '<', other, '>=')

    def __le__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('"<=" operand must be a single value')
        return FilterExpression(self, '<=', other, '>')

    def __eq__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('"==" operand must be a single value')
        return FilterExpression(self, '=', other, '!=')

    def __ne__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('"!=" operand must be a single value')
        return FilterExpression(self, '!=', other, '=')

    def __gt__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('">" operand must be a single value')
        return FilterExpression(self, '>', other, '<=')

    def __ge__(self, other):
        if isinstance(other, (list, tuple)):
            raise ValueError('">=" operand must be a single value')
        return FilterExpression(self, '>=', other, '<')


class _ResourceFields(object):

    def __getattr__(self, name):
        field = _ResourceField(name)
        setattr(self, name, field)
        return field


def resource_base(singular=None,
                  collection=None,
                  metadata=None,
                  resides_under_marketplace=True,
                  nested_under=None):

    class Base(type):

        def __new__(mcs, classname, bases, clsdict):
            the_init, the_new = make_constructors()

            fields = _ResourceFields()
            clsdict.update({
                'RESOURCE': metadata or {
                    'singular': singular or classname.lower(),
                    'collection': collection,
                    'resides_under_marketplace': resides_under_marketplace,
                    'nested_under': nested_under,
                },
                '__init__': the_init,
                '__new__': the_new,
                'fields': fields,
                'f': fields,
            })

            the_class = type.__new__(mcs, classname, bases, clsdict)
            _RESOURCES.add(the_class)
            return the_class

    return Base


class Account(Resource):
    """
    An Account represents a user within your Marketplace. An Account can have
    two `roles`. If the Account has the `buyer` role then you may create
    Debits using this Account. If they have the `merchant` role then you may
    create Credits to transfer funds to this Account.
    """
    __metaclass__ = resource_base(collection='accounts')

    def debit(self,
              amount=None,
              appears_on_statement_as=None,
              hold_uri=None,
              meta=None,
              description=None,
              source_uri=None,
              merchant_uri=None,
              on_behalf_of=None):
        """
        :rtype: A `Debit` representing a flow of money from this Account to
            your Marketplace's escrow account.
        :param amount: Amount to hold in cents, must be >= 50
        :param appears_on_statement_as: description of the payment as it needs
        to appear on customers card statement
        :param meta: Key/value collection
        :param description: Human readable description
        :param source_uri: A specific funding source such as a `Card`
            associated with this account. If not specified the `Card` most
            recently added to this `Account` is used.
        :param merchant_uri: merchant providing service or delivering product.
               (deprecated - use on_behalf_of instead)
        :param on_behalf_of: the account uri of whomever is providing the
               service or delivering the product.
        """
        if not any((amount, hold_uri)):
            raise ResourceError('Must have an amount or hold uri')
        if all([hold_uri, source_uri]):
            raise ResourceError('Must specify either hold_uri OR source_uri')

        if merchant_uri and not on_behalf_of:
            warnings.warn(
                'merchant_uri is DEPRECATED - use the on_behalf_of '
                'parameter',
                UserWarning,
                stacklevel=2
            )
            merchant_uri = None
            on_behalf_of = merchant_uri

        if on_behalf_of:

            if hasattr(on_behalf_of, 'uri'):
                on_behalf_of = on_behalf_of.uri

            if not isinstance(on_behalf_of, basestring):
                raise ValueError(
                    'The on_behalf_of parameter needs to be an account uri'
                )

            if on_behalf_of == self.uri:
                raise ValueError(
                    'The on_behalf_of parameter MAY NOT be the same account'
                    ' as the account you are debiting!'
                )

        meta = meta or {}
        return Debit(
            uri=self.debits_uri,
            amount=amount,
            appears_on_statement_as=appears_on_statement_as,
            hold_uri=hold_uri,
            meta=meta,
            description=description,
            source_uri=source_uri,
            merchant_uri=merchant_uri,
            on_behalf_of_uri=on_behalf_of,
        ).save()

    def hold(self, amount, description=None, meta=None, source_uri=None,
             appears_on_statement_as=None):
        """
        Creates a new Hold that represents a reservation of money on this
        Account which can be transferred via a Debit to your Marketplace
        up to 7 days later.

        :param amount: Amount to hold in cents, must be >= 50
        :param description: Human readable description
        :param source_uri: A specific funding source such as a `Card`
            associated with this account. If not specified the `Card` most
            recently added to this `Account` is used.
        :param meta: Key/value collection

        :rtype: A `Hold` representing the reservation of funds from this
            Account to your Marketplace.
        """
        meta = meta or {}
        return Hold(
            uri=self.holds_uri,
            amount=amount,
            meta=meta,
            description=description,
            source_uri=source_uri,
            appears_on_statement_as=appears_on_statement_as,
        ).save()

    def credit(self,
               amount,
               description=None,
               meta=None,
               destination_uri=None,
               appears_on_statement_as=None,
               debit_uri=None):
        """
        Returns a new Credit representing a transfer of funds from your
        Marketplace's escrow account to this Account.

        :param amount: Amount to hold in cents
        :param description: Human readable description
        :param meta: Key/value collection
        :param destination_uri: A specific funding destination such as a
                `BankAccount` associated with this account.
        :param appears_on_statement_as: description of the payment as it needs
        :param debit_uri: the debit corresponding to this particular credit

        Returns:
            A `Credit` representing the transfer of funds from your
            Marketplace's escrow account to this Account.
        """
        meta = meta or {}
        return Credit(
            uri=self.credits_uri,
            amount=amount,
            meta=meta,
            description=description,
            appears_on_statement_as=appears_on_statement_as,
            destination_uri=destination_uri,
            debit_uri=debit_uri,
        ).save()

    def add_card(self, card_uri):
        """
        Associates the `Card` represented by `card_uri` with this `Account`.
        """
        self.card_uri = card_uri
        self.save()

    def add_bank_account(self, bank_account_uri):
        """
        Associates the BankAccount represented by `bank_account_uri` with this
        Account.
        """
        self.bank_account_uri = bank_account_uri
        self.save()

    def promote_to_merchant(self, merchant):
        """
        Underwrites this account as a merchant. The `merchant` parameter can
        be either a dictionary of merchant data, or a URI.
        """
        if isinstance(merchant, basestring):
            self.merchant_uri = merchant
        else:
            self.merchant = merchant
        self.save()

    def add_merchant(self, merchant):
        """
        Deprecated alias of `promote_to_merchant` method.
        """
        warnings.warn('The add_merchant method will be deprecated in the '
                      'next minor version of balanced-python, use the '
                      'promote_to_merchant method instead',
                      UserWarning)
        self.promote_to_merchant(merchant)


def cached_per_api_key(bust_cache=False):
    def cacher(f):
        @functools.wraps(f)
        def wrapped(*args, **kwargs):
            from balanced import config, CACHE
            cached = CACHE[config.api_key_secret].get(f.__name__)
            if bust_cache or not cached:
                cached = f(*args, **kwargs)
                CACHE[config.api_key_secret][f.__name__] = cached
            return cached

        return wrapped
    return cacher


class Merchant(Resource):
    """

    """
    __metaclass__ = resource_base(
        collection='merchants',
        resides_under_marketplace=False)

    @classproperty
    @cached_per_api_key()
    def me(cls):
        """
        Returns the Merchant associated with your Marketplace.
        :rtype: `Merchant`
        """
        return cls.query.one()

    @cached_per_api_key(bust_cache=True)
    def save(self):
        return super(Merchant, self).save()


class Marketplace(Resource):
    """

    """
    __metaclass__ = resource_base(
        collection='marketplaces',
        resides_under_marketplace=False)

    def create_card(self,
                    name,
                    card_number,
                    expiration_month,
                    expiration_year,
                    security_code=None,
                    street_address=None,
                    city=None,
                    region=None,
                    postal_code=None,
                    country_code=None,
                    phone_number=None,
                    ):
        """
        Tokenizes a `Card` which can then be associated with an Account.

        :rtype: `Card`
        """

        if region:
            warnings.warn('The region parameter will be deprecated in the '
                          'next minor version of balanced-python',
                          UserWarning)

        return Card(
            card_number=card_number,
            expiration_month=expiration_month,
            expiration_year=expiration_year,
            name=name,
            security_code=security_code,
            street_address=street_address,
            postal_code=postal_code,
            city=city,
            region=region,
            country_code=country_code,
            phone_number=phone_number,
        ).save()

    def create_bank_account(self,
                            name,
                            account_number,
                            bank_code,
                            ):
        """
        Tokenizes a `BankAccount` which can then be associated with an Account.

        :rtype: `BankAccount`
        """
        return BankAccount(
            uri=self.bank_accounts_uri,
            name=name,
            account_number=account_number,
            bank_code=bank_code,
        ).save()

    def create_buyer(self, email_address, card_uri, name=None, meta=None):
        """
        Create a buyer Account associated with this Marketplace.
        """
        meta = meta or {}
        return Account(
            uri=self.accounts_uri,
            email_address=email_address,
            card_uri=card_uri,
            name=name,
            meta=meta,
        ).save()

    def create_merchant(self, email_address, merchant=None,
                        bank_account_uri=None, name=None, meta=None,
                        merchant_uri=None):
        """
        Creates an Account associated with this Marketplace with the role
        `merchant`.

        This method may return 300 if you have not supplied enough information
        for Balanced to identify the Merchant. You may re-submit the request
        with more information, or redirect the Merchant to the supplied url
        so they may manually sign up.

        When you receive a `merchant_uri` from balanced, pass it in:

            Account.create_merchant('mrch@example.com',
                merchant_uri='/v1/TEST-MRxxxx')

        :rtype: Account
        :raises: balanced.exc.HTTPError

            Check the `status_code` and `category_code` properties of the
            exception.

        """
        if not any([merchant, merchant_uri]):
            raise ResourceError('Must have merchant or merchant_uri')
        meta = meta or {}
        return Account(
            uri=self.accounts_uri,
            email_address=email_address,
            merchant=merchant,
            merchant_uri=merchant_uri,
            bank_account_uri=bank_account_uri,
            name=name,
            meta=meta,
        ).save()

    @classproperty
    @cached_per_api_key()
    def my_marketplace(cls):
        """
        Returns an instance representing the marketplace associated with the
        current API key used for this request.
        """
        return cls.query.one()

    mine = my_marketplace

    @cached_per_api_key(bust_cache=True)
    def save(self):
        return super(Marketplace, self).save()


class Debit(Resource):
    """
    A Debit represents a transfer of funds from a buyer's Account to your
    Marketplace's escrow account.

    A Debit may be created directly, or it will be created as a side-effect
    of capturing a Hold. If you create a Debit directly it will implicitly
    create the associated Hold if the funding source supports this.

    If no Hold is specified, the Debit will by default be created using the
    most recently added funding source associated with the Account. You
    cannot change the funding source between creating a Hold and capturing
    it.
    """
    __metaclass__ = resource_base(collection='debits')

    def refund(self, amount=None, description=None, meta=None):
        """
        Refunds this Debit. If no amount is specified it will refund the entire
        amount of the Debit, you may create many Refunds up to the sum total
        of the original Debit's amount.

        :rtype: Refund
        """
        meta = meta or {}
        return Refund(
            uri=self.refunds_uri,
            debit_uri=self.uri,
            amount=amount,
            description=description,
            meta=meta,
        ).save()


class Transaction(Resource):
    """
    Any transfer, or potential transfer of, funds from or to, your Marketplace.
    E.g. a Credit, Debit, Refund, or Hold.
    """
    __metaclass__ = resource_base(collection='transactions')


class Credit(Resource):
    """
    A Credit represents a transfer of funds from your Marketplace's
    escrow account to a Merchant's Account within your Marketplace.

    By default, a Credit is sent to the most recently added funding
    destination associated with an Account. You may specify a specific
    funding source.
    """
    __metaclass__ = resource_base(collection='credits',
                                  resides_under_marketplace=False)


class Refund(Resource):
    """
    A Refund represents a reversal of funds from a Debit. A Debit can have
    many Refunds associated with it up to the total amount of the original
    Debit. Funds are returned to your Marketplace's Merchant Account
    proportional to the amount of the Refund.
    """
    __metaclass__ = resource_base(collection='refunds')


class Hold(Resource):
    """
    A Hold is a reservation of funds on a funding source such as a Card. This
    reservation is guaranteed until the `expires_at` date. You may capture
    the Hold at any time before then which will create a Debit and transfer
    the funds to your Marketplace. If you do not capture the Hold it will
    be marked as invalid which is represented by the `is_void` field being
    set to `True`.

    By default a Hold is created using the most recently added funding source
    on the Account. You may specify a specific funding source such as a `Card`
    or `BankAccount`.

    """
    __metaclass__ = resource_base(collection='holds')

    def void(self):
        """
        Cancels an active Hold.
        """
        self.is_void = True
        self.save()

    def capture(self, **kwargs):
        """
        Captures a valid Hold and returns a Debit representing the transfer of
        funds from the buyer's Account to your Marketplace.

        :rtype: Debit
        """
        return self.account.debit(hold_uri=self.uri, **kwargs)


class APIKey(Resource):
    """
    Your ApiKey is used to authenticate when performing operations on the
    Balanced API.

    **NOTE:** Never give out or expose your ApiKey. You may POST to this
    endpoint to create new ApiKeys and then DELETE any old keys.
    """
    __metaclass__ = resource_base(
        singular='api_key',
        collection='api_keys',
        resides_under_marketplace=False)


class Card(Resource):
    """
    A card represents a source of funds for an Account. You may Hold or Debit
    funds from the account associated with the Card.
    """
    __metaclass__ = resource_base(collection='cards')

    def debit(self, amount=None, appears_on_statement_as=None,
              hold_uri=None, meta=None, description=None):
        """
        Creates a Debit of funds from this Card to your Marketplace's escrow
        account.

        If `appears_on_statement_as` is nil, then Balanced will use the
        `domain_name` property from your Marketplace.

        :rtype: Debit
        """
        if not any((amount, hold_uri)):
            raise ResourceError('Must have amount or hold_uri')

        meta = meta or {}
        return Debit(
            uri=self.account.debits_uri,
            amount=amount,
            appears_on_statement_as=appears_on_statement_as,
            hold_uri=hold_uri,
            meta=meta,
            description=description,
            source_uri=self.uri,
        ).save()

    def hold(self, amount, meta=None, description=None):
        """
        Creates a Hold of funds from this Card to your Marketplace.

        :rtype: Hold
        """
        meta = meta or {}
        return Hold(
            uri=self.account.holds_uri,
            amount=amount,
            meta=meta,
            description=description,
            source_uri=self.uri,
        ).save()


class BankAccount(Resource):
    """
    A BankAccount is both a source, and a destination of, funds. You may
    create Debits and Credits to and from, this funding source.

    *NOTE:* The BankAccount resource does not support creating a Hold.
    """
    __metaclass__ = resource_base(collection='bank_accounts',
                                  resides_under_marketplace=False)

    def debit(self, amount, appears_on_statement_as=None,
              meta=None, description=None):
        """
        Creates a Debit of funds from this BankAccount to your Marketplace's
        escrow account.

        :param appears_on_statement_as: If None then Balanced will use the
            `domain_name` property from your Marketplace.
        :rtype: Debit
        """
        if not amount or amount <= 0:
            raise ResourceError('Must have an amount')
        if not hasattr(self, 'account'):
            raise ResourceError(
                '{} must be associated with an account'.format(self)
            )
        meta = meta or {}
        return Debit(
            uri=self.account.debits_uri,
            amount=amount,
            appears_on_statement_as=appears_on_statement_as,
            meta=meta,
            description=description,
            source_uri=self.uri,
        ).save()

    def credit(self, amount, description=None, meta=None):
        """
        Creates a Credit of funds from your Marketplace's escrow account to
        this BankAccount.

        :rtype: Credit
        """
        if not amount or amount <= 0:
            raise ResourceError('Must have an amount')

        meta = meta or {}

        if getattr(self, 'account', None):
            uri = self.account.credits_uri
        else:
            uri = self.credits_uri
        destination_uri = self.uri

        credit = Credit(
            uri=uri,
            amount=amount,
            description=description,
            meta=meta,
            destination_uri=destination_uri,
        )
        credit.save()
        return credit

    def save(self):
        # default type to 'checking' on create since it was not always required
        if not getattr(self, 'id', None) and not hasattr(self, 'type'):
            self.type = 'checking'
        return super(BankAccount, self).save()

    def verify(self):
        return BankAccountVerification(
            uri=self.verifications_uri,
        ).save()


class BankAccountVerification(Resource):
    """
    Represents an attempt to authenticate a funding instrument so it can
    perform verified operations.
    """
    __metaclass__ = resource_base(collection='verifications',
                                  nested_under=['bank_accounts'],
                                  resides_under_marketplace=False)

    def confirm(self, amount_1, amount_2):
        self.amount_1 = amount_1
        self.amount_2 = amount_2
        return self.save()


class Event(Resource):
    """
    An Event is a snapshot of another resource at a point in time when
    something significant occurred. Events are created when resources are
    created, updated, deleted or otherwise change state such as a Credit being
    marked as failed.
    """
    __metaclass__ = resource_base(collection='events',
                                  resides_under_marketplace=False)


class EventCallback(Resource):
    """
    Represents a single event being sent to a callback.
    """
    __metaclass__ = resource_base(collection='callbacks',
                                  nested_under=['events'],
                                  resides_under_marketplace=False)


class EventCallbackLog(Resource):
    """
    Represents a request and response from single attempt to notify a callback
    of an event.
    """
    __metaclass__ = resource_base(collection='logs',
                                  nested_under=['events', 'callbacks'],
                                  resides_under_marketplace=False)


class Callback(Resource):
    """
    A Callback is a publicly accessible location that can receive POSTed JSON
    data whenever an Event is generated.
    """
    __metaclass__ = resource_base(collection='callbacks',
                                  resides_under_marketplace=True)


class FilterExpression(object):
    def __init__(self, field, op, value, inv_op):
        self.field = field
        self.op = op
        self.value = value
        self.inv_op = inv_op

    def __invert__(self):
        if self.inv_op is None:
            raise TypeError('"{0}" cannot be inverted', self)
        return FilterExpression(self.field, self.inv_op, self.value, self.op)

    def __str__(self):
        return '{0} {1} {2}'.format(
            self.field.name, self.field.op, self.field.values)


class SortExpression(object):
    def __init__(self, field, ascending):
        self.field = field
        self.ascending = ascending

    def __invert__(self):
        return SortExpression(self.field, not self.ascending)
