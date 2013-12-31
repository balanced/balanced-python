from __future__ import unicode_literals

import uritemplate
import wac

from balanced import exc, config, utils


registry = wac.ResourceRegistry(route_prefix='/')


class JSONSchemaCollection(wac.ResourceCollection):

    @property
    def href(self):
        return self.uri


class ObjectifyMixin(wac._ObjectifyMixin):

    def _objectify(self, resource_cls, **fields):
        if 'links' not in fields:
            for key, value in fields.iteritems():
                setattr(self, key, value)
        else:
            self._construct_from_response(**fields)

    def _construct_from_response(self, **payload):
        payload = self._hydrate(payload)
        meta = payload.pop('meta', None)

        if isinstance(self, wac.Page):
            for key, value in meta.iteritems():
                setattr(self, key, value)

        # the remaining keys here are just hypermedia resources
        for _type, resources in payload.iteritems():
            # Singular resources are represented as JSON objects. However,
            # they are still wrapped inside an array:
            cls = Resource.registry[_type]
            # if we couldn't determine the type of this object we use a
            # generic resource object, target that instead.
            if isinstance(self, (cls, Resource)):
                # we are loading onto our self, self is the target
                target = self
            else:
                target = cls(**payload)

            for resource_body in resources:
                for key, value in resource_body.iteritems():
                    if key in ('links',):
                        continue
                    setattr(target, key, value)

                # if loading into a collection
                if target != self:
                    # ensure that we have a collection to hold this item
                    if not hasattr(self, _type):
                        setattr(self, _type, [])
                    getattr(self, _type).append(target)

    @classmethod
    def _hydrate(cls, payload):
        """
        Construct links for objects
        """
        links = payload.pop('links', {})
        for key, uri in links.iteritems():
            variables = uritemplate.variables(uri)
            # marketplaces.card_holds
            collection, resource_type = key.split('.')
            item_attribute = item_property = resource_type
            # if parsed from uri then retrieve. e.g. customer.id
            for item in payload[collection]:
                # find type, fallback to Resource if we can't determine the
                # type e.g. marketplace.owner_customer
                collection_type = Resource.registry.get(resource_type,
                                                        Resource)

                def extract_variables_from_item(item, variables):
                    for v in variables:
                        _, item_attribute = v.split('.')
                        # HACK: https://github.com/PoundPay/balanced/issues/184
                        if item_attribute == 'self':
                            item_attribute = 'id'
                        item_value = item['links'].get(
                            item_attribute, item.get(item_attribute)
                        )
                        if item_value:
                            yield v, item_value

                item_variables = dict(
                    extract_variables_from_item(item, variables))

                # expand variables if we have them, else this is a link like
                # /debits
                if item_variables:
                    parsed_link = uritemplate.expand(uri, item_variables)
                else:
                    parsed_link = uri

                # check if this is a collection or a singular item
                if any(
                        parsed_link.endswith(value)
                        for value in item_variables.itervalues()
                ):
                    # singular
                    item_property += '_href'
                    lazy_href = parsed_link
                else:
                    # collection
                    lazy_href = JSONSchemaCollection(
                        collection_type, parsed_link)
                item.setdefault(item_property, lazy_href)
        return payload


class JSONSchemaPage(wac.Page, ObjectifyMixin):

    @property
    def items(self):
        try:
            return getattr(self, self.resource_cls.type)
        except AttributeError:
            # horrid hack because event callbacks are misnamed.
            return self.event_callbacks


class JSONSchemaResource(wac.Resource, ObjectifyMixin):

    collection_cls = JSONSchemaCollection

    page_cls = JSONSchemaPage

    def save(self):
        cls = type(self)
        attrs = self.__dict__.copy()
        href = attrs.pop('href', None)

        if not href:
            if not cls.uri_gen or not cls.uri_gen.root_uri:
                raise TypeError(
                    'Unable to create {0} resources directly'.format(
                        cls.__name__
                    )
                )
            href = cls.uri_gen.root_uri

        method = cls.client.put if 'id' in attrs else cls.client.post

        attrs = dict(
            (k, v.href if isinstance(v, Resource) else v)
            for k, v in attrs.iteritems()
            if not isinstance(v, (cls.collection_cls))
        )

        resp = method(href, data=attrs)

        instance = self.__class__(**resp.data)
        self.__dict__.clear()
        self.__dict__.update(instance.__dict__)

        return self

    def delete(self):
        self.client.delete(self.href)

    def __dir__(self):
        return self.__dict__.keys()

    def __getattr__(self, item):
        if isinstance(item, basestring):
            suffix = '_href'
            if suffix not in item:
                href = getattr(self, item + suffix, None)
                if href:
                    setattr(self, item, Resource.get(href))
                    return getattr(self, item)
        raise AttributeError(
            "'{}' has no attribute '{}'".format(self.__class__.__name__, item)
        )


class Resource(JSONSchemaResource):

    client = config.client

    registry = registry

    uri_gen = wac.URIGen('/resources', '{resource}')

    def unstore(self):
        return self.delete()


class Marketplace(Resource):

    type = 'marketplaces'

    uri_gen = wac.URIGen('/marketplaces', '{marketplace}')

    @utils.classproperty
    def mine(cls):
        """
        Returns an instance representing the marketplace associated with the
        current API key used for this request.
        """
        return cls.query.one()

    my_marketplace = mine


class APIKey(Resource):

    type = 'api_keys'

    uri_gen = wac.URIGen('/api_keys', '{api_key}')


class CardHold(Resource):

    type = 'card_holds'

    uri_gen = wac.URIGen('/card_holds', '{card_hold}')

    def cancel(self):
        self.is_void = False
        return self.save()

    def capture(self, **kwargs):
        return Debit(
            href=self.debits.href,
            **kwargs
        ).save()


class Transaction(Resource):

    type = 'transactions'


class Credit(Transaction):

    type = 'credits'

    uri_gen = wac.URIGen('/credits', '{credit}')

    def reverse(self, **kwargs):
        return Reversal(
            href=self.reversals.href,
            **kwargs
        ).save()


class Debit(Transaction):

    type = 'debits'

    uri_gen = wac.URIGen('/debits', '{debit}')

    def refund(self, **kwargs):
        return Refund(
            href=self.refunds.href,
            **kwargs
        ).save()


class Refund(Transaction):

    type = 'refunds'

    uri_gen = wac.URIGen('/refunds', '{refund}')


class Reversal(Transaction):

    type = 'reversals'

    uri_gen = wac.URIGen('/reversals', '{reversal}')


class FundingInstrument(Resource):

    type = 'funding_instruments'

    def associate_to(self, customer):
        try:
            self.links
        except AttributeError:
            self.links = {}
        self.links['customer'] = utils.extract_href_from_object(customer)
        self.save()

    def debit(self, amount, **kwargs):
        return Debit(
            href=self.debits.href,
            amount=amount,
            **kwargs
        ).save()

    def credit(self, amount, **kwargs):
        return Credit(
            href=self.credits.href,
            amount=amount,
            **kwargs
        ).save()


class BankAccount(FundingInstrument):

    type = 'bank_accounts'

    uri_gen = wac.URIGen('/bank_accounts', '{bank_account}')

    def verify(self):
        return BankAccountVerification(
            href=self.bank_account_verifications.href
        ).save()


class BankAccountVerification(Resource):

    type = 'bank_account_verifications'

    def confirm(self, amount_1, amount_2):
        self.amount_1 = amount_1
        self.amount_2 = amount_2
        return self.save()


class Card(FundingInstrument):

    type = 'cards'

    uri_gen = wac.URIGen('/cards', '{card}')

    def hold(self, amount, **kwargs):
        return CardHold(
            href=self.card_holds.href,
            amount=amount,
            **kwargs
        ).save()


class Customer(Resource):

    type = 'customers'

    uri_gen = wac.URIGen('/customers', '{customer}')


class Order(Resource):

    type = 'orders'

    uri_gen = wac.URIGen('/orders', '{order}')


class Callback(Resource):

    type = 'callbacks'

    uri_gen = wac.URIGen('/callbacks', '{callback}')


class Event(Resource):

    type = 'events'

    uri_gen = wac.URIGen('/events', '{event}')


class EventCallback(Resource):

    type = 'event_callbacks'


class EventCallbackLog(Resource):

    type = 'event_callback_logs'
