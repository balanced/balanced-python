% if mode == 'definition':
balanced.BankAccount.delete()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_account = balanced.BankAccount.find('/v1/bank_accounts/BARHVIjybOf6v3uQsYOnAYE')
bank_account.delete()
% endif