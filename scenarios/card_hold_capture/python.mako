% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card_hold = balanced.CardHold.fetch('/card_holds/HL7K6mNHtWSl33Whc0WDOJ81')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU7c8cBtxfllT4M6zDyjbJA1', u'source': u'CC7JlMyXyZ8W3RBfE1SSlnrD', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T22:00:25.687801Z', updated_at=u'2014-04-25T22:00:26.140296Z', failure_reason=None, currency=u'USD', transaction_number=u'W113-190-1861', href=u'/debits/WD2NZluFdmQMTHhvyVjSjmp', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD2NZluFdmQMTHhvyVjSjmp')
% endif