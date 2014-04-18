% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/cards/CCVkCgaysaNhZH3ITVLmQ9X')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'source': u'CCVkCgaysaNhZH3ITVLmQ9X', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-17T22:39:46.207280Z', updated_at=u'2014-04-17T22:39:46.903737Z', failure_reason=None, currency=u'USD', transaction_number=u'W087-679-0746', href=u'/debits/WD19cDwPJMMJj6UWn4YI2bGZ', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD19cDwPJMMJj6UWn4YI2bGZ')
% endif