% if mode == 'definition':
balanced.BankAccount.save()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

bank_account = balanced.BankAccount(
  routing_number='121000358'
  type='checking'
  account_number='9900000001'
  name='Johann Bernoulli'
).save()
% endif