% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ3NheXIi1UxUiNtkaSo1ZI5')
verification.confirm(amount_1=1, amount_2=1)
% endif