% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ7n38gpwYou03mkP4Vt83Cl')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA7lb2roygfhwDfbvikDLcHP'}, created_at=u'2014-04-25T22:00:00.062125Z', attempts_remaining=2, updated_at=u'2014-04-25T22:00:03.198401Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ7n38gpwYou03mkP4Vt83Cl', meta={}, id=u'BZ7n38gpwYou03mkP4Vt83Cl')
% endif