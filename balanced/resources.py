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
        # setting values locally, not from server
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

            for resource_body in resources:
                # if we couldn't determine the type of this object we use a
                # generic resource object, target that instead.
                if isinstance(self, (cls, Resource)):
                    # we are loading onto our self, self is the target
                    target = self
                else:
                    target = cls()
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
                    if not item_property.endswith('_href'):
                        item_property += '_href'
                    lazy_href = parsed_link

                elif '{' in parsed_link and '}' in parsed_link:
                    # the link is of the form /asdf/{asdf} which means
                    # that the variables could not be resolved as it
                    # was None.  Instead of making it into a page object
                    # we explicitly set it to None to represent the
                    # attribute is None
                    lazy_href = None
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
            try:
                return getattr(self, self.resource_cls.type)
            except AttributeError:
                # horrid hack because event callbacks are misnamed.
                return self.event_callbacks
        except AttributeError:
            # Notice:
            # there is no resources key in the response from server
            # if the list is empty, so when we try to get something like
            # `debits`, an AttributeError will be raised. Not sure is this
            # behavior a bug of server, but anyway, this is just a workaround
            # here for solving the problem. The issue was posted here
            # https://github.com/balanced/balanced-python/issues/93
            return []


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
                    item_type = Resource.registry.get(item + 's', Resource)
                    setattr(self, item, item_type.get(href))
                    return getattr(self, item)
        raise AttributeError(
            "'{0}' has no attribute '{1}'".format(
                self.__class__.__name__, item
            )
        )


class Resource(JSONSchemaResource):

    client = config.client

    registry = registry

    uri_gen = wac.URIGen('/resources', '{resource}')

    def unstore(self):
        return self.delete()

    @classmethod
    def fetch(cls, href):
        return cls.get(href)

    @classmethod
    def get(cls, href):
        if href.startswith('/resources'):
            # hackety hack hax
            # resource is an abstract type, we shouldn't have it comeing back itself
            # instead we need to figure out the type based off the api response
            resp = cls.client.get(href)
            resource = [
                k for k in resp.data.keys() if k != 'links' and k != 'meta'
            ]
            if resource:
                return Resource.registry.get(resource[0], cls)(**resp.data)
            return cls(**resp.data)
        return super(Resource, cls).get(href)


class Marketplace(Resource):
    """
    A Marketplace represents your central broker for all operations on the
    Balanced API.

    A Marketplace has a single `owner_customer` which represents your person or
    business.

    All Resources apart from APIKeys are associated with a Marketplace.

    A Marketplace has an escrow account which receives all funds from Debits
    that are not associated with Orders. The sum of the escrow (`in_escrow`) is
    (Debits - Refunds + Reversals - Credits).
    """

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
    """
    Your APIKey is used to authenticate when performing operations on the
    Balanced API. You must create an APIKey before you create a Marketplace.

    **NOTE:** Never give out or expose your APIKey. You may POST to this
    endpoint to create new APIKeys and then DELETE any old keys.
    """
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
    """
    Any transfer, funds from or to, your Marketplace's escrow account or the
    escrow account of an Order associated with your Marketplace.
    E.g. a Credit, Debit, Refund, or Reversal.

    If the Transaction is associated with an Order then it will be applied to
    the Order's escrow account, not to the Marketplace's escrow account.
    """

    type = 'transactions'


class Credit(Transaction):
    """
    A Credit represents a transfer of funds from your Marketplace's
    escrow account to a FundingInstrument.

    Credits are created by calling the `credit` method on a FundingInstrument.
    """

    type = 'credits'

    uri_gen = wac.URIGen('/credits', '{credit}')

    def reverse(self, **kwargs):
        """
        Reverse a Credit.  If no amount is specified it will reverse the entire
        amount of the Credit, you may create many Reversals up to the sum of
        the total amount of the original Credit.

        :rtype: Reversal
        """
        return Reversal(
            href=self.reversals.href,
            **kwargs
        ).save()


class Debit(Transaction):
    """
    A Debit represents a transfer of funds from a FundingInstrument to your
    Marketplace's escrow account.

    A Debit may be created directly, or it will be created as a side-effect
    of capturing a CardHold. If you create a Debit directly it will implicitly
    create the associated CardHold if the FundingInstrument supports this.
    """

    type = 'debits'

    uri_gen = wac.URIGen('/debits', '{debit}')

    def refund(self, **kwargs):
        """
        Refunds this Debit. If no amount is specified it will refund the entire
        amount of the Debit, you may create many Refunds up to the sum total
        of the original Debit's amount.

        :rtype: Refund
        """
        return Refund(
            href=self.refunds.href,
            **kwargs
        ).save()


class Refund(Transaction):
    """
    A Refund represents a reversal of funds from a Debit. A Debit can have
    many Refunds associated with it up to the total amount of the original
    Debit. Funds are returned to your Marketplace's escrow account
    proportional to the amount of the Refund.
    """

    type = 'refunds'

    uri_gen = wac.URIGen('/refunds', '{refund}')


class Reversal(Transaction):
    """
    A Reversal represents a reversal of funds from a Credit. A Credit can have
    many Reversal associated with it up to the total amount of the original
    Credit. Funds are returned to your Marketplace's escrow account
    proportional to the amount of the Reversal.
    """

    type = 'reversals'

    uri_gen = wac.URIGen('/reversals', '{reversal}')


class FundingInstrument(Resource):
    """
    A FundingInstrument is either (or both) a source or destination of funds.
    You may perform `debit` or `credit` operations on a FundingInstrument to
    transfer funds to or from your Marketplace's escrow.
    """

    type = 'funding_instruments'

    def associate_to_customer(self, customer):
        try:
            self.links
        except AttributeError:
            self.links = {}
        self.links['customer'] = utils.extract_href_from_object(customer)
        self.save()

    def debit(self, amount, **kwargs):
        """
        Creates a Debit of funds from this FundingInstrument to your
        Marketplace's escrow account.

        :param appears_on_statement_as: If None then Balanced will use the
            `domain_name` property from your Marketplace.
        :rtype: Debit
        """
        return Debit(
            href=self.debits.href,
            amount=amount,
            **kwargs
        ).save()

    def credit(self, amount, **kwargs):
        """
        Creates a Credit of funds from your Marketplace's escrow account to
        this FundingInstrument.

        :rtype: Credit
        """
 
        if not hasattr(self, 'credits'):
            raise exc.FundingSourceNotCreditable()
        return Credit(
            href=self.credits.href,
            amount=amount,
            **kwargs
        ).save()


class BankAccount(FundingInstrument):
    """
    A BankAccount is both a source, and a destination of, funds. You may
    create Debits and Credits to and from, this funding instrument.
    """

    type = 'bank_accounts'

    uri_gen = wac.URIGen('/bank_accounts', '{bank_account}')

    def verify(self):
        """
        Creates a verification of the associated BankAccount so it can
        perform verified operations (debits).

        :rtype: BankAccountVerification
        """
        return BankAccountVerification(
            href=self.bank_account_verifications.href
        ).save()


class BankAccountVerification(Resource):
    """
    Represents an attempt to verify the associated BankAccount so it can
    perform verified operations (debits).
    """

    type = 'bank_account_verifications'

    def confirm(self, amount_1, amount_2):
        self.amount_1 = amount_1
        self.amount_2 = amount_2
        return self.save()


class Card(FundingInstrument):
    """
    A card represents a source of funds. You may Debit funds from the Card.
    """

    type = 'cards'

    uri_gen = wac.URIGen('/cards', '{card}')

    def hold(self, amount, **kwargs):
        return CardHold(
            href=self.card_holds.href,
            amount=amount,
            **kwargs
        ).save()


class Customer(Resource):
    """
    A Customer represents a business or person within your Marketplace. A
    Customer can have many funding instruments such as cards and bank accounts
    associated to them. Customers are logical grouping constructs for
    associating many Transactions and FundingInstruments.
    """

    type = 'customers'

    uri_gen = wac.URIGen('/customers', '{customer}')

    def create_order(self, **kwargs):
        return Order(href=self.orders.href, **kwargs).save()


class Order(Resource):
    """
    An Order is a logical construct for grouping Transactions.

    An Order may have 0:n Transactions associated with it so long as the sum
    (`amount_escrowed`) which is calculated as
    (Debits - Refunds - Credits + Reversals), is always >= 0.
    """

    type = 'orders'

    uri_gen = wac.URIGen('/orders', '{order}')

    def credit_to(self, destination, amount, **kwargs):
        return destination.credit(order=self.href,
                                  amount=amount,
                                  **kwargs)

    def debit_from(self, source, amount, **kwargs):
        return source.debit(order=self.href,
                            amount=amount,
                            **kwargs)


class Callback(Resource):
    """
    A Callback is a publicly accessible location that can receive POSTed JSON
    data whenever an Event is generated.
    """

    type = 'callbacks'

    uri_gen = wac.URIGen('/callbacks', '{callback}')


class Dispute(Resource):
    """
    A dispute occurs when a customer disputes a transaction that
    occurred on their funding instrument.
    """
    type = 'disputes'

    uri_gen = wac.URIGen('/disputes', '{dispute}')


class Event(Resource):
    """
    An Event is a snapshot of another resource at a point in time when
    something significant occurred. Events are created when resources are
    created, updated, deleted or otherwise change state such as a Credit being
    marked as failed.
    """

    type = 'events'

    uri_gen = wac.URIGen('/events', '{event}')


class EventCallback(Resource):
    """
    Represents a single event being sent to a callback.
    """

    type = 'event_callbacks'


class EventCallbackLog(Resource):
    """
    Represents a request and response from single attempt to notify a callback
    of an event.
    """

    type = 'event_callback_logs'


class ExternalAccount(FundingInstrument):
    """
    An External Account represents a source of funds provided by an external, 3rd
    party processor. You may Debit funds from the account if can_debit is true.
    """

    type = 'external_accounts'

    uri_gen = wac.URIGen('/external_accounts', '{external_account}')
