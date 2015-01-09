% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

credit = balanced.Credit.fetch('/credits/CR4RdgCoOqYhr4sjPdcDjf3T')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'pending', description=u'New description for credit', links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'destination': u'BA45anEaEr8g0lOhzhcE9VAN', u'order': None}, amount=5000, created_at=u'2015-01-09T03:24:07.078171Z', updated_at=u'2015-01-09T03:24:15.880088Z', failure_reason=None, currency=u'USD', transaction_number=u'CRGY7-P5M-OXHO', href=u'/credits/CR4RdgCoOqYhr4sjPdcDjf3T', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4RdgCoOqYhr4sjPdcDjf3T')
% endif