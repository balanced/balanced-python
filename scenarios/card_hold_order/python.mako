% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
card = balanced.Card.fetch('/cards/CC3vhL91rWtwtHcOBl0ITshG')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR3vURGwVtqDnnkRS9fgH41G'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': u'OR3vURGwVtqDnnkRS9fgH41G', u'card': u'CC3vhL91rWtwtHcOBl0ITshG', u'debit': None}, amount=5000, created_at=u'2015-01-09T03:23:34.413652Z', updated_at=u'2015-01-09T03:23:34.713108Z', expires_at=u'2015-01-16T03:23:34.647009Z', failure_reason=None, currency=u'USD', transaction_number=u'HLVKB-4MF-JL5N', href=u'/card_holds/HL4gu3SX4Z5LEPYtYhg6HOOp', meta={}, failure_reason_code=None, voided_at=None, id=u'HL4gu3SX4Z5LEPYtYhg6HOOp')
% endif