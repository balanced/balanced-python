% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ4x3kqJ5rTrM8LL0WmP4GUZ')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA4plzFRTGgaoZftGcIJH3Py'}, created_at=u'2014-12-17T00:37:01.526181Z', attempts_remaining=2, updated_at=u'2014-12-17T00:37:07.367632Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ4x3kqJ5rTrM8LL0WmP4GUZ', meta={}, id=u'BZ4x3kqJ5rTrM8LL0WmP4GUZ')
% endif