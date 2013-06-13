import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


customer = balanced.Customer.find('/v1/customers/CU3yjAGMemMoFZobP2nTfFmo')
customer.add_card('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/cards/CC3zvlRrKda8oJ5jUNIdk7rg')