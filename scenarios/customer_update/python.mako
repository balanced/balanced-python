% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

customer = balanced.Debit.fetch('/customers/CU4xpIqZ7mf2fuLpBoXgoG7m')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% endif