% if mode == 'definition':
balanced.Account.credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

payable_account = balanced.Account.fetch('/accounts/AT3ogJE07IErLJYR510QO6sM')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR3vURGwVtqDnnkRS9fgH41G',
  meta={
    'rating': '8'
  }
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'A simple credit', links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'destination': u'AT3ogJE07IErLJYR510QO6sM', u'order': u'OR3vURGwVtqDnnkRS9fgH41G'}, amount=1000, created_at=u'2015-01-09T03:22:56.285894Z', updated_at=u'2015-01-09T03:22:56.407717Z', failure_reason=None, currency=u'USD', transaction_number=u'CRMJJ-XQI-MUMX', href=u'/credits/CR3zAL8gnvuDGGTqr1UqehlS', meta={u'rating': u'8'}, failure_reason_code=None, appears_on_statement_as=u'ThingsCo', id=u'CR3zAL8gnvuDGGTqr1UqehlS')
% endif