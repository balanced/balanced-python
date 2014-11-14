% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-YnjW61zGxEdhpzkBcohFZ2bZhjrdtbDW')

order = balanced.Order.fetch('/orders/OR46RV9HyvE8esnGbLPkJKW4')
card = balanced.Card.fetch('/cards/CC2vbVLAMwrNqlLvp3km6hq0')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR46RV9HyvE8esnGbLPkJKW4'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': u'OR46RV9HyvE8esnGbLPkJKW4', u'card': u'CC2vbVLAMwrNqlLvp3km6hq0', u'debit': None}, amount=5000, created_at=u'2014-11-13T19:57:30.442727Z', updated_at=u'2014-11-13T19:57:30.726474Z', expires_at=u'2014-11-20T19:57:30.624532Z', failure_reason=None, currency=u'USD', transaction_number=u'HL654-SXW-6M8Q', href=u'/card_holds/HL1LZwQgbt3Saga2dnKeihKd', meta={}, failure_reason_code=None, voided_at=None, id=u'HL1LZwQgbt3Saga2dnKeihKd')
% endif