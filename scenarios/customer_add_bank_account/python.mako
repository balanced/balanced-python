% if mode == 'definition':
balanced.Customer.add_bank_account
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU22xHvLbgGKfzamLW8IZJsr')
customer.add_bank_account('/v1/bank_accounts/BA24Zc2jo1moflunJDxKrCrB')
% endif