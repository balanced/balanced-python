% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5wAfv8JaMsEn9idXrLZZZT')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'card': u'CC5nCSU0yFp3qxR4p6UZST7y', u'debit': None}, amount=5000, created_at=u'2014-03-06T19:22:44.421804Z', updated_at=u'2014-03-06T19:22:48.496101Z', expires_at=u'2014-03-13T19:22:44.661981Z', failure_reason=None, currency=u'USD', transaction_number=u'HL116-606-6128', href=u'/card_holds/HL5wAfv8JaMsEn9idXrLZZZT', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL5wAfv8JaMsEn9idXrLZZZT')
% endif