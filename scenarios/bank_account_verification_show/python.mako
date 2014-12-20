% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ37ck8caI06gKMmpz70Zt6w')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA305R4Vwumo1KjT9kwVrdfT'}, created_at=u'2014-12-18T18:21:10.883036Z', attempts_remaining=3, updated_at=u'2014-12-18T18:21:10.883038Z', deposit_status=u'pending', attempts=0, href=u'/verifications/BZ37ck8caI06gKMmpz70Zt6w', meta={}, id=u'BZ37ck8caI06gKMmpz70Zt6w')
% endif