% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ1eMAsKt13lIj2SkvvHlxfT')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA17zYxBNrmg9isvicjz9Ae4'}, created_at=u'2014-11-14T19:27:13.837146Z', attempts_remaining=2, updated_at=u'2014-11-14T19:27:24.030337Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ1eMAsKt13lIj2SkvvHlxfT', meta={}, id=u'BZ1eMAsKt13lIj2SkvvHlxfT')
% endif