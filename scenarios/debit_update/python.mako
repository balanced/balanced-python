% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

debit = balanced.Debit.fetch('/debits/WDh5j4t3Rkh7oeONR9Izy61')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'source': u'CCf1fF6z2RjwvniinUVefhb', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T22:00:38.385908Z', updated_at=u'2014-04-25T22:00:57.649072Z', failure_reason=None, currency=u'USD', transaction_number=u'W249-399-4192', href=u'/debits/WDh5j4t3Rkh7oeONR9Izy61', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WDh5j4t3Rkh7oeONR9Izy61')
% endif