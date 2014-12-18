% if mode == 'definition':
balanced.Account.credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

payable_account = balanced.Account.fetch('/accounts/AT43cMKrvwKEJnV5qX8wCqY0')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR483MoeOnJEXwkxqoPdnDF3'meta[rating]=8,
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'A simple credit', links={u'customer': u'CU42QGL6X08UHbQnRqgCNtKg', u'destination': u'AT43cMKrvwKEJnV5qX8wCqY0', u'order': u'OR483MoeOnJEXwkxqoPdnDF3'}, amount=1000, created_at=u'2014-12-18T18:37:17.500080Z', updated_at=u'2014-12-18T18:37:17.620931Z', failure_reason=None, currency=u'USD', transaction_number=u'CRA2V-TJP-CBO8', href=u'/credits/CR54cX9URL7OXgy3jOxCdgPe', meta={u'rating': u'8'}, failure_reason_code=None, appears_on_statement_as=u'ThingsCo', id=u'CR54cX9URL7OXgy3jOxCdgPe')
% endif