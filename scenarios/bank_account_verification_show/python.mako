% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ2AZ05mk2SQsEcicjSh3UN')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BAcRGk40xmI8meZpNLB3oYp'}, created_at=u'2014-04-17T22:38:45.205941Z', attempts_remaining=3, updated_at=u'2014-04-17T22:38:45.505191Z', deposit_status=u'succeeded', attempts=0, href=u'/verifications/BZ2AZ05mk2SQsEcicjSh3UN', meta={}, id=u'BZ2AZ05mk2SQsEcicjSh3UN')
% endif