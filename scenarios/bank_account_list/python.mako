% if mode == 'definition':
balanced.BankAccount().query
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_accounts = balanced.BankAccount.query
% endif