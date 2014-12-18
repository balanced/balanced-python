% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ4x3kqJ5rTrM8LL0WmP4GUZ')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA4plzFRTGgaoZftGcIJH3Py'}, created_at=u'2014-12-17T00:37:01.526181Z', attempts_remaining=3, updated_at=u'2014-12-17T00:37:01.526182Z', deposit_status=u'pending', attempts=0, href=u'/verifications/BZ4x3kqJ5rTrM8LL0WmP4GUZ', meta={}, id=u'BZ4x3kqJ5rTrM8LL0WmP4GUZ')
% endif