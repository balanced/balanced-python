% if mode == 'definition':
balanced.BankAccount.query()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_accounts = balanced.BankAccount.query.all()
% endif