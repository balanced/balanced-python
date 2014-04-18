% if mode == 'definition':
balanced.Credit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

credit = balanced.Credit.fetch('/credits/CROijU7WflyjITPTGU9GMlL')
credit.meta = {
  'twitter.id': '1234987650',
  'facebook.user_id': '0192837465',
  'my-own-customer-id': '12345'
}
credit.save()
% elif mode == 'response':
Credit(status=u'succeeded', description=u'New description for credit', links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'destination': u'BAscOV2erMwv3yhIb5sFTaV', u'order': None}, amount=5000, created_at=u'2014-04-17T22:39:27.622238Z', updated_at=u'2014-04-17T22:39:33.204162Z', failure_reason=None, currency=u'USD', transaction_number=u'CR574-106-7569', href=u'/credits/CROijU7WflyjITPTGU9GMlL', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CROijU7WflyjITPTGU9GMlL')
% endif