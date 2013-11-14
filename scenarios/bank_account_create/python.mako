% if mode == 'definition':
balanced.BankAccount.save()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()
% endif