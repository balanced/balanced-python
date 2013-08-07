% if mode == 'definition':

balanced.Customer.add_card
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


customer = balanced.Customer.find('/v1/customers/CU50w7Cg6mD57vSK0K5nMi2i')
customer.add_card('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/cards/CC523BGAwIKAD6qmDRggQW9V')

% endif