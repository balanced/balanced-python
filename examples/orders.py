

import balanced


key = balanced.APIKey().save()
balanced.configure(key.secret)
balanced.Marketplace().save()

# here's the merchant customer who is going to be the recipient of the order
merchant = balanced.Customer().save()
bank_account = balanced.BankAccount(
    account_number="1234567890",
    routing_number="321174851",
    name="Jack Q Merchant",
).save()
bank_account.associate_to_customer(merchant)

order = merchant.create_order(description='foo order')

card = balanced.Card(
    number="5105105105105100",
    expiration_month="12",
    expiration_year="2015",
).save()

# debit the card and associate with the order.
card.debit(amount=100, order=order)

order = balanced.Order.fetch(order.href)

# the order captured the amount of the debit
assert order.amount_escrowed == 100

# pay out half
credit = bank_account.credit(amount=50, order=order)

order = balanced.Order.fetch(order.href)

# half the money remains
assert order.amount_escrowed == 50

# let's try paying out to another funding instrument that is not the recipient
# of the order.
another_bank_account = balanced.BankAccount(
    account_number="1234567890",
    routing_number="321174851",
    name="Jack Q Merchant",
).save()

another_merchant = balanced.Customer().save()
another_bank_account.associate_to_customer(another_merchant)

# cannot credit to a bank account which is not assigned to either the
# marketplace or the merchant associated with the order.
try:
    another_credit = another_bank_account.credit(amount=50, order=order)
except balanced.exc.BalancedError as ex:
    print(ex)

assert ex is not None
