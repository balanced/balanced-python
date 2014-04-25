% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

debit = balanced.Debit.fetch('/debits/WD4vEUJj36IpPHTnLKMYzHgh')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5', u'source': u'CC4tvKLTKXcBJAgkGvPEW58N', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:09:59.895549Z', updated_at=u'2014-04-25T20:10:19.169392Z', failure_reason=None, currency=u'USD', transaction_number=u'W296-328-8320', href=u'/debits/WD4vEUJj36IpPHTnLKMYzHgh', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4vEUJj36IpPHTnLKMYzHgh')
% endif