% if mode == 'definition':
balanced.Customer.holds
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

customer = balanced.Customer.find('/v1/customers/CUcKunVjtvF7v8JlC5ZBdeM/holds')
holds = customer.holds.all()
% endif