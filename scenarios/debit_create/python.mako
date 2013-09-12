% if mode == 'definition':
balanced.Customer.debit(...)
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC7uApw73nVe459gEQ4ynVJu')
customer.debit(
  appears_on_statement_as='Statement text'
  amount='5000'
  description='Some descriptive text for the debit in the dashboard'
)
% endif