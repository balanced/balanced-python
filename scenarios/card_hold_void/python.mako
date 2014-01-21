% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card_hold = balanced.CardHold.fetch('/card_holds/HL3mplcWSeG79TTxpFyHlxTh')
card_hold.cancel()
% endif