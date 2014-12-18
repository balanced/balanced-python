% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

credit = balanced.Credit.fetch('/credits/CR63lfosmGuD9LlV7hGlBZYx')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'pending', description=u'New description for credit', links={u'customer': u'CU42QGL6X08UHbQnRqgCNtKg', u'destination': u'BA4UZsYXpf2BX97v5WPaT57O', u'order': None}, amount=5000, created_at=u'2014-12-17T00:38:25.378523Z', updated_at=u'2014-12-17T00:38:33.905118Z', failure_reason=None, currency=u'USD', transaction_number=u'CRPWV-R3X-ZOZK', href=u'/credits/CR63lfosmGuD9LlV7hGlBZYx', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR63lfosmGuD9LlV7hGlBZYx')
% endif