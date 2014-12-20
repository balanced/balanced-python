import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

customer = balanced.Debit.fetch('/customers/CU4wBFaFMi043nnBgRNrgTXa')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()