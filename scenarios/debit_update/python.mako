% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

debit = balanced.Debit.fetch('/debits/WD6wpBAzwRyTIEdqkKgUSLHa')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': None, u'source': u'CC5zxUdioIB0Dc2rjM1PK3Cw', u'dispute': None, u'order': None, u'card_hold': u'HL6wornOIcZRjXMzqcuVFcjK'}, amount=5000, created_at=u'2014-12-17T00:38:51.217173Z', updated_at=u'2014-12-17T00:38:57.811744Z', failure_reason=None, currency=u'USD', transaction_number=u'WJF4-1ZO-S4E2', href=u'/debits/WD6wpBAzwRyTIEdqkKgUSLHa', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6wpBAzwRyTIEdqkKgUSLHa')
% endif