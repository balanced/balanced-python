% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = balanced.Credit.fetch('/credits/CR2UtQgq6L3FPd1YoOc8eyOC')
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU2N5goX8AQJE0CCPeapHUsM', u'destination': u'BA2QAksIxlLt60lqKc1wwgJy', u'order': None}, amount=5000, created_at=u'2014-01-27T22:57:19.073817Z', updated_at=u'2014-01-27T22:57:20.208794Z', failure_reason=None, currency=u'USD', transaction_number=u'CR408-633-3169', href=u'/credits/CR2UtQgq6L3FPd1YoOc8eyOC', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR2UtQgq6L3FPd1YoOc8eyOC')
% endif