% if mode == 'definition':
balanced.Debit.query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

debits = balanced.Debit.query
% endif
