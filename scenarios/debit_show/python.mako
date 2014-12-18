% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

debit = balanced.Debit.fetch('/debits/WD6wpBAzwRyTIEdqkKgUSLHa')
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC5zxUdioIB0Dc2rjM1PK3Cw', u'dispute': None, u'order': None, u'card_hold': u'HL6wornOIcZRjXMzqcuVFcjK'}, amount=5000, created_at=u'2014-12-17T00:38:51.217173Z', updated_at=u'2014-12-17T00:38:51.957850Z', failure_reason=None, currency=u'USD', transaction_number=u'WJF4-1ZO-S4E2', href=u'/debits/WD6wpBAzwRyTIEdqkKgUSLHa', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6wpBAzwRyTIEdqkKgUSLHa')
% endif