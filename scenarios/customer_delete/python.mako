% if mode == 'definition':
balanced.Customer(...).unstore()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU29FAMV807phGkX4wGIuymW')
customer.unstore()
% endif