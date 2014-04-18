% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ2AZ05mk2SQsEcicjSh3UN')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BAcRGk40xmI8meZpNLB3oYp'}, created_at=u'2014-04-17T22:38:45.205941Z', attempts_remaining=2, updated_at=u'2014-04-17T22:38:49.126263Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ2AZ05mk2SQsEcicjSh3UN', meta={}, id=u'BZ2AZ05mk2SQsEcicjSh3UN')
% endif