% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL44qbPoom3uVlTlEGBZV7z2')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC2IDFuWSoETEIxLBJ73fXgs', u'debit': None}, amount=5000, created_at=u'2014-12-18T18:22:03.540762Z', updated_at=u'2014-12-18T18:22:04.740464Z', expires_at=u'2014-12-25T18:22:03.686049Z', failure_reason=None, currency=u'USD', transaction_number=u'HLPWM-ZXJ-40YT', href=u'/card_holds/HL44qbPoom3uVlTlEGBZV7z2', meta={}, failure_reason_code=None, voided_at=u'2014-12-18T18:22:04.430089Z', id=u'HL44qbPoom3uVlTlEGBZV7z2')
% endif