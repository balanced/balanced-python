% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

credit = balanced.Credit.fetch('/credits/CR4yt4sdkTWI1t3HVS16mNAV')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'succeeded', description=u'New description for credit', links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5', u'destination': u'BA3Y63fK5STwlhKNMkE3Utmd', u'order': None}, amount=5000, created_at=u'2014-04-25T20:10:02.398021Z', updated_at=u'2014-04-25T20:10:07.895933Z', failure_reason=None, currency=u'USD', transaction_number=u'CR883-913-0274', href=u'/credits/CR4yt4sdkTWI1t3HVS16mNAV', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4yt4sdkTWI1t3HVS16mNAV')
% endif