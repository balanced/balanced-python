% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

credit = balanced.Credit.fetch('/credits/CRjCksasJ36xjkBXRYvlCh7')
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'destination': u'BA7zu6QXmylsn0o6qVpS8UO9', u'order': None}, amount=5000, created_at=u'2014-04-25T22:00:40.640801Z', updated_at=u'2014-04-25T22:00:41.046644Z', failure_reason=None, currency=u'USD', transaction_number=u'CR574-547-8777', href=u'/credits/CRjCksasJ36xjkBXRYvlCh7', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CRjCksasJ36xjkBXRYvlCh7')
% endif