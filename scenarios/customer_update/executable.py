import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

customer = balanced.Debit.fetch('/customers/CU3OK2QNsz3KjXHMz1GCH1Cq')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()