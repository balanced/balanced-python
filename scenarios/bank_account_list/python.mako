% if mode == 'definition':
balanced.BankAccount.query()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

bank_accounts = balanced.BankAccount.query.all()
% endif