% if mode == 'definition':
balanced.BankAccount.debit()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_account = balanced.BankAccount.find('/bank_accounts/BA6jsxwAXYrt4sLjYUw1a1gS')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()
% endif