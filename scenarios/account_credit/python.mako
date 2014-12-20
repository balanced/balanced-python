% if mode == 'definition':
balanced.Account.credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

payable_account = balanced.Account.fetch('/accounts/AT2E6Ju62P9AnTJwe0fL5kOI')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR2JfBYxYlDAF3L48u9DtIEU'meta[rating]=8,
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'A simple credit', links={u'customer': u'CU2DRnwOXfbxBlKb5CUWwWJi', u'destination': u'AT2E6Ju62P9AnTJwe0fL5kOI', u'order': u'OR2JfBYxYlDAF3L48u9DtIEU'}, amount=1000, created_at=u'2014-12-19T19:33:31.202845Z', updated_at=u'2014-12-19T19:33:31.295273Z', failure_reason=None, currency=u'USD', transaction_number=u'CR77S-5TO-YRYQ', href=u'/credits/CR5bM6mv38qwW1NEo0ssJTiR', meta={u'rating': u'8'}, failure_reason_code=None, appears_on_statement_as=u'ThingsCo', id=u'CR5bM6mv38qwW1NEo0ssJTiR')
% endif