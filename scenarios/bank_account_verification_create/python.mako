% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7lb2roygfhwDfbvikDLcHP')
verification = bank_account.verify()
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA7lb2roygfhwDfbvikDLcHP'}, created_at=u'2014-04-25T22:00:00.062125Z', attempts_remaining=3, updated_at=u'2014-04-25T22:00:00.483961Z', deposit_status=u'succeeded', attempts=0, href=u'/verifications/BZ7n38gpwYou03mkP4Vt83Cl', meta={}, id=u'BZ7n38gpwYou03mkP4Vt83Cl')
% endif