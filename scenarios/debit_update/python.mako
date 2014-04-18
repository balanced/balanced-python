% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

debit = balanced.Debit.fetch('/debits/WDLlpoutDUH8fGfp28GeT0V')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'source': u'CCVkCgaysaNhZH3ITVLmQ9X', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-17T22:39:24.996837Z', updated_at=u'2014-04-17T22:39:44.848896Z', failure_reason=None, currency=u'USD', transaction_number=u'W766-065-9952', href=u'/debits/WDLlpoutDUH8fGfp28GeT0V', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WDLlpoutDUH8fGfp28GeT0V')
% endif