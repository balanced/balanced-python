% if mode == 'definition':
balanced.Account.settle()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

payable_account = balanced.Account.fetch('/accounts/AT3ogJE07IErLJYR510QO6sM')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN',
  description='Payout A',
  meta={
    'group': 'alpha'
  }
)
)
% elif mode == 'response':
Settlement(status=u'pending', description=u'Payout A', links={u'source': u'AT3ogJE07IErLJYR510QO6sM', u'destination': u'BA45anEaEr8g0lOhzhcE9VAN'}, amount=1000, created_at=u'2015-01-09T03:25:48.587751Z', updated_at=u'2015-01-09T03:25:48.946792Z', failure_reason=None, currency=u'USD', transaction_number=u'SCRGN-RWP-FFSL', href=u'/settlements/ST6HmBuLJSEa82oUwId1AShW', meta={u'group': u'alpha'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ThingsCo', id=u'ST6HmBuLJSEa82oUwId1AShW')
% endif