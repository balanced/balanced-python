import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


customer = balanced.Customer.find('/v1/customers/CU54O6mXfm2zETAzuQeMxHpS')
customer.add_bank_account('/v1/bank_accounts/BA55EaXnaE4Yos3ihJawNiaK')