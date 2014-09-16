% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC526JELNk4pET43bVu6rGkZ')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU36bqPshRNopkLNM6qBmn5e', u'source': u'CC526JELNk4pET43bVu6rGkZ', u'dispute': None, u'order': None, u'card_hold': u'HL6pxgGDopPHeblb183AnZIY'}, amount=5000, created_at=u'2014-09-02T18:27:40.732341Z', updated_at=u'2014-09-02T18:27:52.735975Z', failure_reason=None, currency=u'USD', transaction_number=u'WPVT-4X8-G9SR', href=u'/debits/WD6pxYaIfe2CHQHoDj5pA2Xu', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6pxYaIfe2CHQHoDj5pA2Xu')
% endif