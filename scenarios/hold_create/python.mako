% if mode == 'definition':

balanced.Customer.hold(...)
% else:
import balanced

balanced.configure("c72cb360d3ae11e29593026ba7d31e6f")


customer = balanced.Customer.find('/v1/customers/CU7GuPv9Y2F8ySwJHuHL0YWq')
customer.hold(
    amount='5000',
    description='Some descriptive text for the debit in the dashboard',
)

% endif