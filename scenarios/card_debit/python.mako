% if mode == 'definition':
balanced.Card.debit()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

card = balanced.Card.find('/cards/CC6MQlq1xIGRLEMBWQcD4Dcr')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif