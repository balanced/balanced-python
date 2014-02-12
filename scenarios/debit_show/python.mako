% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

debit = balanced.Debit.fetch('/debits/WD2Fd3jVcMZEWyXHtG3U1LRM')
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC2uc8iPDjgyxOXHVtnZloyI', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-01-27T22:57:05.511023Z', updated_at=u'2014-01-27T22:57:10.153696Z', failure_reason=None, currency=u'USD', transaction_number=u'W906-153-1439', href=u'/debits/WD2Fd3jVcMZEWyXHtG3U1LRM', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD2Fd3jVcMZEWyXHtG3U1LRM')
% endif