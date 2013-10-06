import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

customer = balanced.Customer.find('/v1/customers/CU7wGDVh8FjYMPfkPl9SzWAu')
debits = customer.debits.all()