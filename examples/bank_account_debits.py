"""
Learn how to verify a bank account so you can debit with it.
"""
from __future__ import unicode_literals
import balanced


def init():
    key = balanced.APIKey().save()
    balanced.configure(key.secret)
    balanced.Marketplace().save()


def main():
    init()

    # create a bank account
    bank_account = balanced.BankAccount(
        account_number='1234567890',
        bank_code='321174851',
        name='Jack Q Merchant',
    ).save()
    account = balanced.Account().save()
    account.add_bank_account(bank_account.uri)
    bank_account = account.bank_accounts[0]

    print('you can\'t debit until you authenticate')
    try:
        bank_account.debit(100)
    except balanced.exc.HTTPError as ex:
        print('Debit failed, %s' % ex.message)

    # verify
    verification = bank_account.verify()

    print('PROTIP: for TEST bank accounts the valid amount is always 1 and 1')
    try:
        verification.confirm(1, 2)
    except balanced.exc.BankAccountVerificationFailure as ex:
        print('Authentication error , %s' % ex.message)

    if verification.confirm(1, 1).state != 'verified':
        raise Exception('impossible')
    debit = bank_account.debit(100)
    print('debited the bank account %s for %d cents' % (
        debit.source.uri,
        debit.amount
    ))
    print('and there you have it')


if __name__ == '__main__':
    main()
