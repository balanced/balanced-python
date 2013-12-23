from __future__ import unicode_literals

import uritemplate
import wac

from balanced import exc, config


registry = wac.ResourceRegistry(route_prefix='/')


class JSONSchemaCollection(wac.ResourceCollection):
    pass


class ObjectifyMixin(wac._ObjectifyMixin):

    def _objectify(self, resource_cls, **fields):
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
            for v in variables:
                collection, item_attribute = v.split('.')

            for item in payload[collection]:
                # find type, fallback to Resource if we can't determine the
                # type e.g. marketplace.owner_customer
                collection_type = Resource.registry.get(resource_type, Resource)
                if item_attribute in item['links']:
                    # singular
                    uri_value = item['links'][item_attribute]
                    parsed_link = uritemplate.expand(
                        uri, {key: uri_value}
                    )
                    if uri_value:
                        item_property += '_href'
                        lazy_href = parsed_link
                    else:
                        lazy_href = None
                else:
                    # collection
                    uri_value = item.get(item_attribute, None)
                    parsed_link = uritemplate.expand(
                        uri, {'.'.join([collection, item_attribute]): uri_value}
                    )
                    lazy_href = JSONSchemaCollection(
                        collection_type, parsed_link)
                item.setdefault(item_property, lazy_href)
        return payload


class JSONSchemaPage(wac.Page, ObjectifyMixin):

    @property
    def items(self):
        return getattr(self, self.resource_cls.type)


class JSONSchemaResource(wac.Resource, ObjectifyMixin):

    collection_cls = JSONSchemaCollection

    page_cls = JSONSchemaPage

    def __getattr__(self, item):
        if isinstance(item, basestring):
            suffix = '_href'
            href = getattr(self, item + suffix, None)
            if href:
                setattr(self, item, Resource.get(href))
                return getattr(self, item)


class Resource(JSONSchemaResource):

    client = config.client

    registry = registry

    uri_gen = wac.URIGen('/resources', '{resource}')


class Marketplace(Resource):

    type = 'marketplaces'

    uri_gen = wac.URIGen('/marketplaces', '{marketplace}')

    @classmethod
    def mine(cls):
        """
        Returns an instance representing the marketplace associated with the
        current API key used for this request.
        """
        return cls.query.one()


class APIKey(Resource):

    type = 'api_keys'

    uri_gen = wac.URIGen('/api_keys', '{api_key}')


class CardHold(Resource):

    type = 'card_holds'


class Transaction(Resource):

    type = 'transactions'

    def refund(self, **kwargs):
        raise NotImplementedError()

    def reverse(self, **kwargs):
        raise NotImplementedError()


class Credit(Transaction):

    type = 'credits'


class Debit(Transaction):

    type = 'debits'


class Refund(Transaction):

    type = 'refunds'


class Reversal(Transaction):

    type = 'reversals'


class FundingInstrument(Resource):

    type = 'funding_instruments'

    def associate_to(self, customer):
        raise NotImplementedError()

    def debit(self, **kwargs):
        raise NotImplementedError()

    def credit(self, **kwargs):
        raise NotImplementedError()


class BankAccount(FundingInstrument):

    type = 'bank_accounts'


class BankAccountVerification(Resource):

    type = 'bank_account_verifications'


class Card(FundingInstrument):

    type = 'cards'


class Customer(Resource):

    type = 'customers'


class Order(Resource):

    type = 'orders'


class Callback(Resource):

    type = 'callbacks'


class Event(Resource):

    type = 'events'


class EventCallback(Resource):
    pass


class EventCallbackLog(Resource):
    pass
