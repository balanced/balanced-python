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
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU1f8Ygc4t0F2FKNcw235x9I', u'source': u'CC2abDOQVm5aNFhHpcRvWS02', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-01-27T22:56:45.623268Z', updated_at=u'2014-01-27T22:56:47.926021Z', failure_reason=None, currency=u'USD', transaction_number=u'W744-719-1832', href=u'/debits/WD2iSCukjXyeRdkvX3cW0PmC', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD2iSCukjXyeRdkvX3cW0PmC')
% endif