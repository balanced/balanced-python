% if mode == 'definition':
balanced.Customer.debit(...)
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

customer = balanced.Customer.find('/v1/customers/CUuDKfPHvZhTmaNbEsg1BOO')
customer.debit(
  appears_on_statement_as='Statement text'
  amount=5000
  description='Some descriptive text for the debit in the dashboard'
)
% endif