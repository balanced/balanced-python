% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card_hold = balanced.CardHold.fetch('/card_holds/HL5gGjFGvSfw0pkPB93SnYze')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC47wPIfNkploi0BbLRDqEYo', u'dispute': None, u'order': None, u'card_hold': u'HL5gGjFGvSfw0pkPB93SnYze'}, amount=5000, created_at=u'2014-12-17T00:37:51.402494Z', updated_at=u'2014-12-17T00:37:51.900143Z', failure_reason=None, currency=u'USD', transaction_number=u'WL8F-R9A-EFI1', href=u'/debits/WD5r9kEqaHO5t4u36XZ87gbK', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD5r9kEqaHO5t4u36XZ87gbK')
% endif