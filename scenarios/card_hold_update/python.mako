% if mode == 'definition':
balanced.CardHold.save()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

card_hold = balanced.CardHold.find('/card_holds/HL6za54jlFLUAvEqDEULOwXC')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% endif