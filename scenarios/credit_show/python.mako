% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = balanced.Credit.fetch('/credits/CR2UtQgq6L3FPd1YoOc8eyOC')
% elif mode == 'response':
Credit(
 'amount': 5000,
 'appears_on_statement_as': u'example.com',
 'created_at': u'2014-01-27T22:57:19.073817Z',
 'currency': u'USD',
 'description': None,
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/credits/CR2UtQgq6L3FPd1YoOc8eyOC',
 'id': u'CR2UtQgq6L3FPd1YoOc8eyOC',
 'links': {u'customer': u'CU2N5goX8AQJE0CCPeapHUsM',
           u'destination': u'BA2QAksIxlLt60lqKc1wwgJy',
           u'order': None},
 'meta': {},
 'status': u'succeeded',
 'transaction_number': u'CR408-633-3169',
 'updated_at': u'2014-01-27T22:57:20.208794Z')
 
% endif