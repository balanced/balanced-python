% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA50LpPrCTB63Ecm0wEgdOQM')
verification = bank_account.verify()
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA50LpPrCTB63Ecm0wEgdOQM'}, created_at=u'2014-03-06T19:22:24.651572Z', attempts_remaining=3, updated_at=u'2014-03-06T19:22:25.233126Z', deposit_status=u'succeeded', attempts=0, href=u'/verifications/BZ5alC0fajkuBOvOU7lVT7QJ', meta={}, id=u'BZ5alC0fajkuBOvOU7lVT7QJ')
% endif