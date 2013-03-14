from __future__ import unicode_literals
import os

import balanced


host = os.environ.get('BALANCED_HOST')
options = {}
if host:
    options['scheme'] = 'http'
    options['host'] = host
    options['port'] = 5000

balanced.configure(options)

print "create our new api key"
api_key = balanced.APIKey().save()
print "Our secret is: ", api_key.secret

print "configure with our secret " + api_key.secret
balanced.configure(api_key.secret)

print "create our marketplace"
marketplace = balanced.Marketplace().save()

if not balanced.Merchant.me:
    raise Exception("Merchant.me should not be nil")
print "what's my merchant?, easy: Merchant.me: ", balanced.Merchant.me

# what's my marketplace?
if not balanced.Marketplace.my_marketplace:
    raise Exception("Marketplace.my_marketplace should not be nil")
print "what's my marketplace?, easy: Marketplace.my_marketplace: {}".format(
    balanced.Marketplace.my_marketplace
)

print "My marketplace's name is: {}".format(marketplace.name)
print "Changing it to TestFooey"
marketplace.name = "TestFooey"
marketplace.save()
print "My marketplace name is now: {}".format(marketplace.name)
if marketplace.name != 'TestFooey':
    raise Exception("Marketplace name is NOT TestFooey!")

print "cool! let's create a new card."
card = balanced.Card(
    card_number="5105105105105100",
    expiration_month="12",
    expiration_year="2015",
).save()
print "Our card uri: " + card.uri

print "create our **buyer** account"
buyer = marketplace.create_buyer("buyer@example.org", card.uri)
print "our buyer account: " + buyer.uri

print "hold some amount of funds on the buyer, lets say 15$"
the_hold = buyer.hold(1500)

print "ok, no more holds! lets just capture it (for the full amount)"
debit = the_hold.capture()

print "hmm, how much money do i have in escrow? should equal the debit amount"
balanced.bust_cache()
marketplace = balanced.Marketplace.my_marketplace
if marketplace.in_escrow != 1500:
    raise Exception("1500 is not in escrow! this is wrong")
print "i have {} in escrow!".format(marketplace.in_escrow)

print "cool. now let me refund the full amount"
refund = debit.refund()  # the full amount!

print ("ok, we have a merchant that's signing up, let's create an account for "
       "them first, lets create their bank account.")

bank_account = balanced.BankAccount(
    account_number="1234567890",
    bank_code="321174851",
    name="Jack Q Merchant",
).save()

merchant = marketplace.create_merchant(
    "merchant@example.org",
        {
        'type': "person",
        'name': "Billy Jones",
        'street_address': "801 High St.",
        'postal_code': "94301",
        'country': "USA",
        'dob': "1842-01",
        'phone_number': "+16505551234",
        },
    bank_account.uri,
    "Jack Q Merchant",
    )

print "oh our buyer is interested in buying something for 130.00$"
another_debit = buyer.debit(13000, "MARKETPLACE.COM")

print "lets credit our merchant 110.00$"
credit = merchant.credit(11000, "Buyer purchased something on MARKETPLACE.COM")

print "lets assume the marketplace charges 15%, so it earned $20"
mp_credit = marketplace.owner_account.credit(2000,
                                             "Our commission from MARKETPLACE"
                                             ".COM")

print "ok lets invalid a card"
card.is_valid = False
card.save()

if card.is_valid:
    raise Exception("This card is INCORRECTLY VALID")

print "invalidating a bank account"
bank_account.delete()

print "and there you have it :)"
