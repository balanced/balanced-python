% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card_hold = balanced.CardHold.fetch('/card_holds/HL7K6mNHtWSl33Whc0WDOJ81')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'card': u'CC7JlMyXyZ8W3RBfE1SSlnrD', u'debit': None}, amount=5000, created_at=u'2014-04-25T22:00:20.558033Z', updated_at=u'2014-04-25T22:00:24.531626Z', expires_at=u'2014-05-02T22:00:20.666972Z', failure_reason=None, currency=u'USD', transaction_number=u'HL046-527-6041', href=u'/card_holds/HL7K6mNHtWSl33Whc0WDOJ81', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL7K6mNHtWSl33Whc0WDOJ81')
% endif