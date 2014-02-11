% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC3kqm84fxh50avenrUsSKbu')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(**{
 'amount': 5000,
 'appears_on_statement_as': u'BAL*Statement text',
 'created_at': u'2014-01-27T22:58:07.291226Z',
 'currency': u'USD',
 'description': u'Some descriptive text for the debit in the dashboard',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/debits/WD3MKNxNTKBGgA7mX50yogiu',
 'id': u'WD3MKNxNTKBGgA7mX50yogiu',
 'links': {u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg',
           u'dispute': None,
           u'order': None,
           u'source': u'CC3kqm84fxh50avenrUsSKbu'},
 'meta': {},
 'status': u'succeeded',
 'transaction_number': u'W180-465-2000',
 'updated_at': u'2014-01-27T22:58:09.706862Z'
})
% endif