% if mode == 'definition':
balanced.Customer.refunds
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

customer = balanced.Customer.find('/v1/customers/CUuDKfPHvZhTmaNbEsg1BOO')
refunds = customer.refunds.all()
% endif