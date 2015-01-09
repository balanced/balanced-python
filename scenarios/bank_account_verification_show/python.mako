% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ3SVvXTx85CrYo8045tr2cU')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA3LVXVgJLrzkmB3vUntKJ6t'}, created_at=u'2015-01-09T03:23:13.465191Z', attempts_remaining=3, updated_at=u'2015-01-09T03:23:13.465192Z', deposit_status=u'pending', attempts=0, href=u'/verifications/BZ3SVvXTx85CrYo8045tr2cU', meta={}, id=u'BZ3SVvXTx85CrYo8045tr2cU')
% endif