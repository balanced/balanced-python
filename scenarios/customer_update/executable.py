import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

customer = balanced.Debit.fetch('/customers/CU3SSJgvA5Z69kt05MusbPeE')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()