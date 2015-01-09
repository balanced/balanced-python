% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card = balanced.Card.fetch('/cards/CC5RRvpnZIg0PWdSphR8xxPa')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC5RRvpnZIg0PWdSphR8xxPa', u'dispute': None, u'order': None, u'card_hold': u'HL5Svbmw6nDDP5HO2RblsBCJ'}, amount=5000, created_at=u'2015-01-09T03:25:03.383375Z', updated_at=u'2015-01-09T03:25:04.090381Z', failure_reason=None, currency=u'USD', transaction_number=u'WA4K-D44-O5DR', href=u'/debits/WD5SwXr9jcCfCmmjTH5MCMFD', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5SwXr9jcCfCmmjTH5MCMFD')
% endif