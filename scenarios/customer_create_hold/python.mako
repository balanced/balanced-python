% if mode == 'definition':

balanced.Customer.debit()
% else:
import balanced

balanced.configure("c72cb360d3ae11e29593026ba7d31e6f")


customer = balanced.Customer.find('/v1/customers/CU7GuPv9Y2F8ySwJHuHL0YWq')
customer.hold(amount='1000')

% endif