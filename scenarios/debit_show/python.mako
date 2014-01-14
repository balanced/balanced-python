% if mode == 'definition':
balanced.Debit.fetch()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

debit = balanced.Debit.find('/debits/WD3xghyI3uMTgjRP5aJugoQy')
% endif
