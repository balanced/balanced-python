% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

credit = balanced.Credit.fetch('/credits/CR3DLTIjMve5idvjBrXNKBHE')
% endif