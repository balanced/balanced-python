% if mode == 'definition':
balanced.Customer.credit()
% else:
import balanced

balanced.configure('ak-test-2KZfoLyijij3Y6OyhDAvFRF9tXzelBLpD')

customer = balanced.Customer.find('/v1/customers/CU5f64LhFMO8cf7N1sQSRVOo')
customer.credit(amount=100)
% endif