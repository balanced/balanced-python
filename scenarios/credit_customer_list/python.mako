% if mode == 'definition':

balanced.Customer.credits
% else:
import balanced

balanced.configure("c72cb360d3ae11e29593026ba7d31e6f")


customer = balanced.Customer.find('/v1/customers/CU6PXyMacKRYKNJPJFKtONK0')
credits = customer.credits.all()

% endif