% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card = balanced.Card.fetch('/cards/CC4zyuNpxY0A0eAf87SeULCR')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC4zyuNpxY0A0eAf87SeULCR', u'dispute': None, u'order': None, u'card_hold': u'HL5NbQRZSxbr0o64QWu7szni'}, amount=5000, created_at=u'2015-01-09T03:24:58.643499Z', updated_at=u'2015-01-09T03:24:59.368094Z', failure_reason=None, currency=u'USD', transaction_number=u'WS4G-1FI-AT4Z', href=u'/debits/WD5Nd61WpdlRk6D39YVNFAEo', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5Nd61WpdlRk6D39YVNFAEo')
% endif