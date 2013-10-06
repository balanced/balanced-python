% if mode == 'definition':
balanced.Verification().save()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA6czUjW6j4sMputedTuxXE6')
verification = bank_account.verify()
% endif