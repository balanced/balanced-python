% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(**{
 'amount': 5000,
 'appears_on_statement_as': u'BAL*ShowsUpOnStmt',
 'created_at': u'2014-01-27T22:56:45.623268Z',
 'currency': u'USD',
 'description': u'Some descriptive text for the debit in the dashboard',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/debits/WD2iSCukjXyeRdkvX3cW0PmC',
 'id': u'WD2iSCukjXyeRdkvX3cW0PmC',
 'links': {u'customer': u'CU1f8Ygc4t0F2FKNcw235x9I',
           u'dispute': None,
           u'order': None,
           u'source': u'CC2abDOQVm5aNFhHpcRvWS02'},
 'meta': {u'holding.for': u'user1', u'meaningful.key': u'some.value'},
 'status': u'succeeded',
 'transaction_number': u'W744-719-1832',
 'updated_at': u'2014-01-27T22:56:47.926021Z'
})
% endif