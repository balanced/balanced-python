% if mode == 'definition':
balanced.Customer.credits
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CUyABeNYx8vHAaP4KRsd1j4')
credits = customer.credits.all()
% endif