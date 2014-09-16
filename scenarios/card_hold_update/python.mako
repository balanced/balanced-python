% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4io3nFmawRhnkkUWnC1Eoo')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'card': u'CC4hAPsanjFP7QWIIAAPAwKh', u'debit': None}, amount=5000, created_at=u'2014-09-02T18:25:44.114448Z', updated_at=u'2014-09-02T18:25:50.616558Z', expires_at=u'2014-09-09T18:25:44.889479Z', failure_reason=None, currency=u'USD', transaction_number=u'HLOUQ-V39-L4PE', href=u'/card_holds/HL4io3nFmawRhnkkUWnC1Eoo', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL4io3nFmawRhnkkUWnC1Eoo')
% endif