% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5Ig892KbmJyDqED5fYsJ8m')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC5nCSU0yFp3qxR4p6UZST7y', u'debit': None}, amount=5000, created_at=u'2014-03-06T19:22:51.758438Z', updated_at=u'2014-03-06T19:22:52.865612Z', expires_at=u'2014-03-13T19:22:52.154430Z', failure_reason=None, currency=u'USD', transaction_number=u'HL671-938-5651', href=u'/card_holds/HL5Ig892KbmJyDqED5fYsJ8m', meta={}, failure_reason_code=None, voided_at=u'2014-03-06T19:22:52.865616Z', id=u'HL5Ig892KbmJyDqED5fYsJ8m')
% endif