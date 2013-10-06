% if mode == 'definition':
balanced.BankAccount.credits
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA6wDj2MwJTwkPA4s4rEMq2y')
credits = bank_account.credits.all()
% endif