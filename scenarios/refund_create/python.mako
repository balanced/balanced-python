% if mode == 'definition':
balanced.Debit().refund()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

debit = balanced.Debit.find('/debits/WD4d9CgVjg8lX8g8l1638Bor')
refund = debit.refund()
% endif