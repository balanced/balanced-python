% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4CIbHV4zlSfx5c6eKK1AOY')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC4hAPsanjFP7QWIIAAPAwKh', u'debit': None}, amount=5000, created_at=u'2014-09-02T18:26:02.180272Z', updated_at=u'2014-09-02T18:26:04.701130Z', expires_at=u'2014-09-09T18:26:03.227642Z', failure_reason=None, currency=u'USD', transaction_number=u'HL3O6-J0N-LZ9C', href=u'/card_holds/HL4CIbHV4zlSfx5c6eKK1AOY', meta={}, failure_reason_code=None, voided_at=u'2014-09-02T18:26:04.701132Z', id=u'HL4CIbHV4zlSfx5c6eKK1AOY')
% endif