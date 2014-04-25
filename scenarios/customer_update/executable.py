import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

customer = balanced.Debit.fetch('/customers/CU4GAx8tZTDNIgAmwfV35e53')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()