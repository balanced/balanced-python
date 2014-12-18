% if mode == 'definition':
balanced.Settlement.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

account = balanced.Account.fetch('/accounts/AT43cMKrvwKEJnV5qX8wCqY0')
account.settlements
% elif mode == 'response':

% endif