from __future__ import unicode_literals

from .resources import Resource, resource_base, ResourceError


class Credit(Resource):
    """
    A Credit represents a transfer of funds from your Marketplace's
    escrow account to a Merchant's Account within your Marketplace.

    By default, a Credit is sent to the most recently added funding
    destination associated with an Account. You may specify a specific
    funding source.
    """
    __metaclass__ = resource_base(collection='credits')


class BankAccount(Resource):
    """
    A BankAccount is both a source, and a destination of, funds. You may create
    Debits and Credits to and from this funding source.

    *NOTE:* The BankAccount resource does not support creating a Hold.
    """
    __metaclass__ = resource_base(collection='bank_accounts')

    def debit(self, amount, appears_on_statement_as=None,
              meta=None, description=None):
        """
        Creates a Debit of funds from this MarketplaceBankAccount to your
        Marketplace's escrow account.

        :param appears_on_statement_as: If None then Balanced will use the
            `domain_name` property from your Marketplace.
        :rtype: Debit
        """
        from balanced.resources import Debit

        if not amount or amount <= 0:
            raise ResourceError('Must have an amount')

        meta = meta or {}
        return Debit(
            uri=self.account.debits_uri,
            amount=amount,
            appears_on_statement_as=appears_on_statement_as,
            meta=meta,
            description=description,
        ).save()

    def credit(self, amount, description=None, meta=None):
        """
        Creates a AccountCredit of funds from your Marketplace's escrow account
        to the Account associated with this MarketplaceBankAccount.

        :rtype: AccountCredit
        """
        if not amount or amount <= 0:
            raise ResourceError('Must have an amount')

        meta = meta or {}
        return Credit(
            uri=self.account.credits_uri,
            amount=amount,
            meta=meta,
            description=description,
        ).save()
