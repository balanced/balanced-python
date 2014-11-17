% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC33DRVrekWpiHYjxSdVuqWc')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC33DRVrekWpiHYjxSdVuqWc', u'dispute': None, u'order': None, u'card_hold': u'HL4hdpaliobeCUE5DjmVDGYZ'}, amount=5000, created_at=u'2014-11-14T19:30:01.409681Z', updated_at=u'2014-11-14T19:30:05.883019Z', failure_reason=None, currency=u'USD', transaction_number=u'WQDE-4P6-O15I', href=u'/debits/WD4heQm0HfB6IpymdvsGM8dv', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4heQm0HfB6IpymdvsGM8dv')
% endif