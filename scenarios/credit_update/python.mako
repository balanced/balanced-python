% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = balanced.Credit.fetch('/credits/CR2UtQgq6L3FPd1YoOc8eyOC')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
{u'status': u'succeeded', u'description': u'New description for credit', u'links': {u'customer': u'CU2N5goX8AQJE0CCPeapHUsM', u'destination': u'BA2QAksIxlLt60lqKc1wwgJy', u'order': None}, u'href': u'/credits/CR2UtQgq6L3FPd1YoOc8eyOC', u'created_at': u'2014-01-27T22:57:19.073817Z', u'transaction_number': u'CR408-633-3169', u'failure_reason': None, u'updated_at': u'2014-01-27T22:57:25.832930Z', u'currency': u'USD', u'amount': 5000, u'failure_reason_code': None, u'meta': {u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, u'appears_on_statement_as': u'example.com', u'id': u'CR2UtQgq6L3FPd1YoOc8eyOC'}
% endif