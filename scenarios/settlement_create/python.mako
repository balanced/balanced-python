% if mode == 'definition':
balanced.Account.settle()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

payable_account = balanced.Account.fetch('/accounts/AT2E6Ju62P9AnTJwe0fL5kOI')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY',
  description='Payout A'meta[group]='alpha',
)
% elif mode == 'response':
Settlement(status=u'pending', description=u'Payout A', links={u'source': u'AT2E6Ju62P9AnTJwe0fL5kOI', u'destination': u'BA3uzbngfVXy1SGg25Et7iKY'}, amount=2000, created_at=u'2014-12-19T19:33:49.449170Z', updated_at=u'2014-12-19T19:33:49.876379Z', failure_reason=None, currency=u'USD', transaction_number=u'SCJZG-O1U-9EMP', href=u'/settlements/ST5wi3VdOdaA9HrMpFsJnabr', meta={u'group': u'alpha'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ThingsCo', id=u'ST5wi3VdOdaA9HrMpFsJnabr')
% endif