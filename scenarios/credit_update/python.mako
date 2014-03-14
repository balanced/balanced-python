% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

credit = balanced.Credit.fetch('/credits/CR5XXPwA1ckaTDSIg3593sEx')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'succeeded', description=u'New description for credit', links={u'customer': u'CU5LVuaZG7gURfbA7TuMNoZa', u'destination': u'BA5OqdmH8URGBYpilMITWsNW', u'order': None}, amount=5000, created_at=u'2014-03-06T19:23:08.771807Z', updated_at=u'2014-03-06T19:23:14.259690Z', failure_reason=None, currency=u'USD', transaction_number=u'CR570-678-5174', href=u'/credits/CR5XXPwA1ckaTDSIg3593sEx', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR5XXPwA1ckaTDSIg3593sEx')
% endif