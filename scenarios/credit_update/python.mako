% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

credit = balanced.Credit.fetch('/credits/CR4ooRjxfFr0h6ubhNyETByJ')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'pending', description=u'New description for credit', links={u'customer': u'CU2DRnwOXfbxBlKb5CUWwWJi', u'destination': u'BA3uzbngfVXy1SGg25Et7iKY', u'order': None}, amount=5000, created_at=u'2014-12-18T18:22:21.314604Z', updated_at=u'2014-12-18T18:22:26.624161Z', failure_reason=None, currency=u'USD', transaction_number=u'CRGZQ-ZHQ-EZOK', href=u'/credits/CR4ooRjxfFr0h6ubhNyETByJ', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4ooRjxfFr0h6ubhNyETByJ')
% endif