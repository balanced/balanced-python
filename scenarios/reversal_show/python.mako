% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

refund = balanced.Reversal.find('/reversals/RV4mvdReJFZTySZXe8IyQ8Bi')
% endif