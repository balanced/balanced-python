% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ1NndEHupZUuYDNPf75qXPv')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA1BPjHr0Gjc62pLAlkYCH1b'}, created_at=u'2014-09-02T18:23:26.288399Z', attempts_remaining=2, updated_at=u'2014-09-02T18:23:51.019250Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ1NndEHupZUuYDNPf75qXPv', meta={}, id=u'BZ1NndEHupZUuYDNPf75qXPv')
% endif