% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card.fetch('/cards/CC4GOYzOKyWXBzJMVTs00aNk')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif