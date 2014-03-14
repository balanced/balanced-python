% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

credit = balanced.Credit.fetch('/credits/CR5XXPwA1ckaTDSIg3593sEx')
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CU5LVuaZG7gURfbA7TuMNoZa', u'destination': u'BA5OqdmH8URGBYpilMITWsNW', u'order': None}, amount=5000, created_at=u'2014-03-06T19:23:08.771807Z', updated_at=u'2014-03-06T19:23:09.525306Z', failure_reason=None, currency=u'USD', transaction_number=u'CR570-678-5174', href=u'/credits/CR5XXPwA1ckaTDSIg3593sEx', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR5XXPwA1ckaTDSIg3593sEx')
% endif