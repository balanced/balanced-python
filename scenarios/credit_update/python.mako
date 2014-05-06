% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

credit = balanced.Credit.fetch('/credits/CRjCksasJ36xjkBXRYvlCh7')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'succeeded', description=u'New description for credit', links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'destination': u'BA7zu6QXmylsn0o6qVpS8UO9', u'order': None}, amount=5000, created_at=u'2014-04-25T22:00:40.640801Z', updated_at=u'2014-04-25T22:00:45.823737Z', failure_reason=None, currency=u'USD', transaction_number=u'CR574-547-8777', href=u'/credits/CRjCksasJ36xjkBXRYvlCh7', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CRjCksasJ36xjkBXRYvlCh7')
% endif