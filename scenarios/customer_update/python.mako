% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

customer = balanced.Debit.fetch('/customers/CU5YopHN07Ul5XQnILUifeQT')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
% endif