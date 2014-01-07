% if mode == 'definition':
balanced.CardHold.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

card_hold = balanced.CardHold.find('/card_holds/HL6za54jlFLUAvEqDEULOwXC')
% endif