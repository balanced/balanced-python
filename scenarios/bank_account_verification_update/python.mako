% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ5alC0fajkuBOvOU7lVT7QJ')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA50LpPrCTB63Ecm0wEgdOQM'}, created_at=u'2014-03-06T19:22:24.651572Z', attempts_remaining=2, updated_at=u'2014-03-06T19:22:27.893114Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ5alC0fajkuBOvOU7lVT7QJ', meta={}, id=u'BZ5alC0fajkuBOvOU7lVT7QJ')
% endif