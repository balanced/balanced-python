% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

debit = balanced.Debit.fetch('/debits/WD2Fd3jVcMZEWyXHtG3U1LRM')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
{u'status': u'succeeded', u'description': u'New description for debit', u'links': {u'customer': None, u'source': u'CC2uc8iPDjgyxOXHVtnZloyI', u'order': None, u'dispute': None}, u'href': u'/debits/WD2Fd3jVcMZEWyXHtG3U1LRM', u'created_at': u'2014-01-27T22:57:05.511023Z', u'transaction_number': u'W906-153-1439', u'failure_reason': None, u'updated_at': u'2014-01-27T22:57:53.776191Z', u'currency': u'USD', u'amount': 5000, u'failure_reason_code': None, u'meta': {u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, u'appears_on_statement_as': u'BAL*Statement text', u'id': u'WD2Fd3jVcMZEWyXHtG3U1LRM'}
% endif