% if mode == 'definition':
balanced.BankAccount().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()
% endif