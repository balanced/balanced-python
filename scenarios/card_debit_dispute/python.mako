% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC6KXqaIUXHDh6BJpY2XqRTW')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC6KXqaIUXHDh6BJpY2XqRTW', u'dispute': None, u'order': None, u'card_hold': u'HL6LHgk1aC5vrktgu9raaSSF'}, amount=5000, created_at=u'2014-09-02T18:28:00.469964Z', updated_at=u'2014-09-02T18:28:06.464988Z', failure_reason=None, currency=u'USD', transaction_number=u'WWKX-A69-ZXTQ', href=u'/debits/WD6LJx0cm12NrjiXBR1okKt7', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD6LJx0cm12NrjiXBR1okKt7')
% endif