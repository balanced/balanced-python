% if mode == 'definition':
balanced.Account.settle()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

payable_account = balanced.Account.fetch('/accounts/AT43cMKrvwKEJnV5qX8wCqY0')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA4UZsYXpf2BX97v5WPaT57O',
  description='Payout A'meta[group]='alpha',
)
% elif mode == 'response':
Settlement(status=u'pending', description=u'Payout A', links={u'source': u'AT43cMKrvwKEJnV5qX8wCqY0', u'destination': u'BA4UZsYXpf2BX97v5WPaT57O'}, amount=1000, created_at=u'2014-12-18T19:02:18.268642Z', updated_at=u'2014-12-18T19:02:18.588079Z', failure_reason=None, currency=u'USD', transaction_number=u'SCDO2-8TC-H435', href=u'/settlements/ST17PSrKoKYCwmQMKJW3iTcs', meta={u'group': u'alpha'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ThingsCo', id=u'ST17PSrKoKYCwmQMKJW3iTcs')
% endif