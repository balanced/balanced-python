from __future__ import unicode_literals

import balanced


print "create our new api key"
api_key = balanced.APIKey().save()
print "Our secret is: ", api_key.secret

print "configure with our secret " + api_key.secret
balanced.configure(api_key.secret)

print "create our marketplace"
marketplace = balanced.Marketplace().save()

# what's my marketplace?
if not balanced.Marketplace.my_marketplace:
    raise Exception("Marketplace.my_marketplace should not be nil")
print "what's my marketplace?, easy: Marketplace.my_marketplace: {0}".format(
    balanced.Marketplace.my_marketplace
)

print "My marketplace's name is: {0}".format(marketplace.name)
print "Changing it to TestFooey"
marketplace.name = "TestFooey"
marketplace.save()
print "My marketplace name is now: {0}".format(marketplace.name)
if marketplace.name != 'TestFooey':
    raise Exception("Marketplace name is NOT TestFooey!")

print "cool! let's create a new card."
card = balanced.Card(
    number="5105105105105100",
    expiration_month="12",
    expiration_year="2015",
).save()

print "Our card href: " + card.href

print "create our **buyer** account"
buyer = balanced.Customer(email="buyer@example.org", source=card).save()
print "our buyer account: " + buyer.href

print "hold some amount of funds on the buyer, lets say 15$"
the_hold = card.hold(1500)

print "ok, no more holds! lets just capture it (for the full amount)"
debit = the_hold.capture()

print "hmm, how much money do i have in escrow? should equal the debit amount"
marketplace = balanced.Marketplace.my_marketplace
if marketplace.in_escrow != 1500:
    raise Exception("1500 is not in escrow! this is wrong")
print "i have {0} in escrow!".format(marketplace.in_escrow)

print "cool. now let me refund the full amount"
refund = debit.refund()  # the full amount!

print ("ok, we have a merchant that's signing up, let's create an account for "
       "them first, lets create their bank account.")

bank_account = balanced.BankAccount(
    account_number="1234567890",
    routing_number="321174851",
    name="Jack Q Merchant",
).save()

merchant = balanced.Customer(
    email_address="merchant@example.org",
    name="Billy Jones",
    address={
        'street_address': "801 High St.",
        'postal_code': "94301",
        'country': "USA",
    },
    dob="1842-01",
    phone_number="+16505551234",
    destination=bank_account,
).save()

print "oh our buyer is interested in buying something for 130.00$"
another_debit = card.debit(13000, appears_on_statement_as="MARKETPLACE.COM")

print "lets credit our merchant 110.00$"
credit = bank_account.credit(
    11000, description="Buyer purchased something on MARKETPLACE.COM")

print "lets assume the marketplace charges 15%, so it earned $20"
mp_credit = marketplace.owner_customer.bank_accounts.first().credit(
    2000, description="Our commission from MARKETPLACE.COM")

print "ok lets invalid a card"
card.delete()

assert buyer.cards.count() == 0

print "invalidating a bank account"
bank_account.delete()

print "associate a card with an exiting customer"
card = balanced.Card(
    number="5105105105105100",
    expiration_month="12",
    expiration_year="2015",
).save()

card.associate_to_customer(buyer)

assert buyer.cards.count() == 1

print "and there you have it :)"
