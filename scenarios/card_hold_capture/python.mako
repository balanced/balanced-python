% if mode == 'definition':
balanced.CardHold.capture()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

card_hold = balanced.CardHold.find('/card_holds/HL6za54jlFLUAvEqDEULOwXC')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% endif