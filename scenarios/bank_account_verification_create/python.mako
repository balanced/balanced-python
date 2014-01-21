% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_account = balanced.BankAccount.find('/bank_accounts/BA2RfTVAgg4CdTJrVc7RPw7s')
verification = bank_account.verify()
% endif