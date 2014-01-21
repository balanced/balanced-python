% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card_hold = balanced.CardHold.find('/card_holds/HL3dgrKQhecdILFZKW0FQLYs')
% endif