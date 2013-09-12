import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC6FO1fS8ypyifj7q31FSvTx')
customer.add_bank_account('/v1/bank_accounts/BA6GQMuP5LafMddzFBrDEi02')