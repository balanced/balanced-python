% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card_hold = balanced.CardHold.fetch('/card_holds/HL7K6mNHtWSl33Whc0WDOJ81')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC7JlMyXyZ8W3RBfE1SSlnrD', u'debit': None}, amount=5000, created_at=u'2014-04-25T22:00:20.558033Z', updated_at=u'2014-04-25T22:00:20.741093Z', expires_at=u'2014-05-02T22:00:20.666972Z', failure_reason=None, currency=u'USD', transaction_number=u'HL046-527-6041', href=u'/card_holds/HL7K6mNHtWSl33Whc0WDOJ81', meta={}, failure_reason_code=None, voided_at=None, id=u'HL7K6mNHtWSl33Whc0WDOJ81')
% endif