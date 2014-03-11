% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = balanced.Debit.fetch('/debits/WD5PTwr2bwJLIyJio1pEpYBr')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': None, u'source': u'CC5Buki6e4Kg4bDVZ3OSfQ8O', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-03-06T19:23:01.594300Z', updated_at=u'2014-03-06T19:23:33.383170Z', failure_reason=None, currency=u'USD', transaction_number=u'W986-715-3969', href=u'/debits/WD5PTwr2bwJLIyJio1pEpYBr', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5PTwr2bwJLIyJio1pEpYBr')
% endif