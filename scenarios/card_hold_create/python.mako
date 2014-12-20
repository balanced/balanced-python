% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC2IDFuWSoETEIxLBJ73fXgs')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC2IDFuWSoETEIxLBJ73fXgs', u'debit': None}, amount=5000, created_at=u'2014-12-18T18:22:03.540762Z', updated_at=u'2014-12-18T18:22:03.888248Z', expires_at=u'2014-12-25T18:22:03.686049Z', failure_reason=None, currency=u'USD', transaction_number=u'HLPWM-ZXJ-40YT', href=u'/card_holds/HL44qbPoom3uVlTlEGBZV7z2', meta={}, failure_reason_code=None, voided_at=None, id=u'HL44qbPoom3uVlTlEGBZV7z2')
% endif