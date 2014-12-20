% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

debit = balanced.Debit.fetch('/debits/WD4FfxxWRRcrlCsGEPti58RT')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': None, u'source': u'CC48j1De9eVYELLivrgDeCM8', u'dispute': None, u'order': None, u'card_hold': u'HL4FeDF5SNigtHsO8xNowrGd'}, amount=5000, created_at=u'2014-12-18T18:22:36.294585Z', updated_at=u'2014-12-18T18:22:40.688348Z', failure_reason=None, currency=u'USD', transaction_number=u'W6BJ-PUQ-8JDC', href=u'/debits/WD4FfxxWRRcrlCsGEPti58RT', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4FfxxWRRcrlCsGEPti58RT')
% endif