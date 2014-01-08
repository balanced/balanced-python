% if mode == 'definition':
balanced.CardHold().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card_holds = balanced.CardHold.query
% endif