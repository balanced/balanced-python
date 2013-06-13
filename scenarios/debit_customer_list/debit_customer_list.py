import balanced

balanced.configure("c72cb360d3ae11e29593026ba7d31e6f")


customer = balanced.Customer.find('/v1/customers/CU6W5pSk2CUXQxhENqyGRvQe')
debits = customer.debits.all()