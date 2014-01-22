% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

debit = balanced.Debit.fetch('/debits/WD3xghyI3uMTgjRP5aJugoQy')
% endif