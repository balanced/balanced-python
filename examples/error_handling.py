from __future__ import unicode_literals

import balanced


api_key = balanced.APIKey().save()
balanced.configure(api_key.secret)
marketplace = balanced.Marketplace().save()

# https://docs.balancedpayments.com/1.1/overview/resources/#test-credit-card-numbers

declined_card = balanced.Card(
    number='4444444444444448',
    expiration_month='12',
    expiration_year='2015',
).save()

bank_account = balanced.BankAccount(
    account_number='1234567890',
    routing_number='321174851',
    name='Jack Q Merchant',
).save()

# see https://github.com/balanced/balanced-api/blob/master/fixtures/_models/error.json for all possible error codes
try:
    declined_card.debit(amount=100)
except balanced.exc.BalancedError as ex:
    assert ex.category_code == 'card-declined'

try:
    bank_account.credit(amount=1000)
except balanced.exc.HTTPError as ex:
    assert ex.category_code == 'insufficient-funds'

try:
    balanced.Card().save()
except balanced.exc.BalancedError as ex:
    # generic missing data has a category-code of request
    assert ex.category_code == 'request'
    # inspect extras to see the exact field that caused the error
    print ex.extras
    # if you want to talk to a Balanced support person about an error, give
    # them the request ID
    print ex.request_id
