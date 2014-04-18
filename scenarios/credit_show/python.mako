% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

credit = balanced.Credit.fetch('/credits/CROijU7WflyjITPTGU9GMlL')
% elif mode == 'response':
Credit(status=u'succeeded', description=None, links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'destination': u'BAscOV2erMwv3yhIb5sFTaV', u'order': None}, amount=5000, created_at=u'2014-04-17T22:39:27.622238Z', updated_at=u'2014-04-17T22:39:27.978440Z', failure_reason=None, currency=u'USD', transaction_number=u'CR574-106-7569', href=u'/credits/CROijU7WflyjITPTGU9GMlL', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CROijU7WflyjITPTGU9GMlL')
% endif