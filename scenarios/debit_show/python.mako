% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

debit = balanced.Debit.fetch('/debits/WD2Fd3jVcMZEWyXHtG3U1LRM')
% elif mode == 'response':
Debit(**{
 'amount': 5000,
 'appears_on_statement_as': u'BAL*Statement text',
 'created_at': u'2014-01-27T22:57:05.511023Z',
 'currency': u'USD',
 'description': u'Some descriptive text for the debit in the dashboard',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/debits/WD2Fd3jVcMZEWyXHtG3U1LRM',
 'id': u'WD2Fd3jVcMZEWyXHtG3U1LRM',
 'links': {u'customer': None,
           u'dispute': None,
           u'order': None,
           u'source': u'CC2uc8iPDjgyxOXHVtnZloyI'},
 'meta': {},
 'status': u'succeeded',
 'transaction_number': u'W906-153-1439',
 'updated_at': u'2014-01-27T22:57:10.153696Z'
})
% endif