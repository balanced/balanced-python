% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BAscOV2erMwv3yhIb5sFTaV')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'destination': u'BAscOV2erMwv3yhIb5sFTaV', u'order': None}, amount=5000, created_at=u'2014-04-17T22:40:19.333713Z', updated_at=u'2014-04-17T22:40:19.557731Z', failure_reason=None, currency=u'USD', transaction_number=u'CR808-363-1663', href=u'/credits/CR1KskgNXcoA6e52QczoCYyF', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR1KskgNXcoA6e52QczoCYyF')
% endif