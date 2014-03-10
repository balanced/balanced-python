'''
Learn how to verify a bank account so you can debit with it.
'''
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
        routing_number='321174851',
        name='Jack Q Merchant',
    ).save()
    customer = balanced.Customer().save()
    bank_account.associate_to_customer(customer)

    print 'you can\'t debit until you authenticate'
    try:
        bank_account.debit(100)
    except balanced.exc.HTTPError as ex:
        print 'Debit failed, %s' % ex.message

    # verify
    verification = bank_account.verify()

    print 'PROTIP: for TEST bank accounts the valid amount is always 1 and 1'
    try:
        verification.confirm(amount_1=1, amount_2=2)
    except balanced.exc.BankAccountVerificationFailure as ex:
        print 'Authentication error , %s' % ex.message

    if verification.confirm(1, 1).verification_status != 'succeeded':
        raise Exception('unpossible')
    debit = bank_account.debit(100)

    print 'debited the bank account %s for %d cents' % (
        debit.source.href,
        debit.amount
    )
    print 'and there you have it'


if __name__ == '__main__':
    main()
