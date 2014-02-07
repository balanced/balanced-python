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
{u'status': u'succeeded', u'description': u'Some descriptive text for the debit in the dashboard', u'links': {u'customer': u'CU1f8Ygc4t0F2FKNcw235x9I', u'source': u'CC2abDOQVm5aNFhHpcRvWS02', u'order': None, u'dispute': None}, u'href': u'/debits/WD2iSCukjXyeRdkvX3cW0PmC', u'created_at': u'2014-01-27T22:56:45.623268Z', u'transaction_number': u'W744-719-1832', u'failure_reason': None, u'updated_at': u'2014-01-27T22:56:47.926021Z', u'currency': u'USD', u'amount': 5000, u'failure_reason_code': None, u'meta': {u'holding.for': u'user1', u'meaningful.key': u'some.value'}, u'appears_on_statement_as': u'BAL*ShowsUpOnStmt', u'id': u'WD2iSCukjXyeRdkvX3cW0PmC'}
% endif