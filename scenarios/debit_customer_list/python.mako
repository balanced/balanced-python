% if mode == 'definition':
balanced.Customer.debits
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU2dUh4jpUihIQsHFbTwuDAc')
debits = customer.debits.all()
% endif