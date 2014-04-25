% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

debit = balanced.Debit.fetch('/debits/WD4vEUJj36IpPHTnLKMYzHgh')
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5', u'source': u'CC4tvKLTKXcBJAgkGvPEW58N', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:09:59.895549Z', updated_at=u'2014-04-25T20:10:00.865462Z', failure_reason=None, currency=u'USD', transaction_number=u'W296-328-8320', href=u'/debits/WD4vEUJj36IpPHTnLKMYzHgh', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4vEUJj36IpPHTnLKMYzHgh')
% endif