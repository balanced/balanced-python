% if mode == 'definition':
balanced.BankAccount.fetch()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_account = balanced.BankAccount.find('/bank_accounts/BA2Yl8BXIiDIdRGu75Ef2mhi')
% endif
