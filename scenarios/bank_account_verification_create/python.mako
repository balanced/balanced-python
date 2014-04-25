% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3IhKG3bIN22cLHbaOIGtHb')
verification = bank_account.verify()
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA3IhKG3bIN22cLHbaOIGtHb'}, created_at=u'2014-04-25T20:09:17.814785Z', attempts_remaining=3, updated_at=u'2014-04-25T20:09:18.218504Z', deposit_status=u'succeeded', attempts=0, href=u'/verifications/BZ3KkIZuSazKfqFrFIfsrhmB', meta={}, id=u'BZ3KkIZuSazKfqFrFIfsrhmB')
% endif