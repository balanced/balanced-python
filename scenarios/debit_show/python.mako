% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = balanced.Debit.fetch('/debits/WD5PTwr2bwJLIyJio1pEpYBr')
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC5Buki6e4Kg4bDVZ3OSfQ8O', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-03-06T19:23:01.594300Z', updated_at=u'2014-03-06T19:23:02.987552Z', failure_reason=None, currency=u'USD', transaction_number=u'W986-715-3969', href=u'/debits/WD5PTwr2bwJLIyJio1pEpYBr', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5PTwr2bwJLIyJio1pEpYBr')
% endif