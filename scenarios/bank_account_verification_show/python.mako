% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ1NndEHupZUuYDNPf75qXPv')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA1BPjHr0Gjc62pLAlkYCH1b'}, created_at=u'2014-09-02T18:23:26.288399Z', attempts_remaining=3, updated_at=u'2014-09-02T18:23:26.288402Z', deposit_status=u'pending', attempts=0, href=u'/verifications/BZ1NndEHupZUuYDNPf75qXPv', meta={}, id=u'BZ1NndEHupZUuYDNPf75qXPv')
% endif