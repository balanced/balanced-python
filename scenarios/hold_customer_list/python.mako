% if mode == 'definition':
balanced.Customer.holds
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU2L1UERNEH5anL0rl1gAgW4/holds')
holds = customer.holds.all()
% endif