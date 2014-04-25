% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ3KkIZuSazKfqFrFIfsrhmB')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(verification_status=u'succeeded', links={u'bank_account': u'BA3IhKG3bIN22cLHbaOIGtHb'}, created_at=u'2014-04-25T20:09:17.814785Z', attempts_remaining=2, updated_at=u'2014-04-25T20:09:20.852682Z', deposit_status=u'succeeded', attempts=1, href=u'/verifications/BZ3KkIZuSazKfqFrFIfsrhmB', meta={}, id=u'BZ3KkIZuSazKfqFrFIfsrhmB')
% endif