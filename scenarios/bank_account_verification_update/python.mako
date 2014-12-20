% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ37ck8caI06gKMmpz70Zt6w')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA305R4Vwumo1KjT9kwVrdfT'}, created_at=u'2014-12-18T18:21:10.883036Z', attempts_remaining=2, updated_at=u'2014-12-18T18:21:16.298025Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ37ck8caI06gKMmpz70Zt6w', meta={}, id=u'BZ37ck8caI06gKMmpz70Zt6w')
% endif