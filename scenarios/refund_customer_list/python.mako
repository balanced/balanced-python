% if mode == 'definition':
balanced.Customer.refunds
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU35rlJBXqlvD9LC26PWu0cy')
refunds = customer.refunds.all()
% endif