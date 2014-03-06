% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ3NheXIi1UxUiNtkaSo1ZI5')
% endif