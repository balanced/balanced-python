% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()
% elif mode == 'response':
BankAccount(**{
 'account_number': u'xxxxxx0001',
 'account_type': u'checking',
 'address': {u'city': None,
             u'country_code': None,
             u'line1': None,
             u'line2': None,
             u'postal_code': None,
             u'state': None},
 'bank_name': u'BANK OF AMERICA, N.A.',
 'can_credit': True,
 'can_debit': False,
 'created_at': u'2014-01-27T22:56:20.540530Z',
 'fingerprint': u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14',
 'href': u'/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy',
 'id': u'BA1QFf0LmIxr8p41msqX46Oy',
 'links': {u'bank_account_verification': None, u'customer': None},
 'meta': {u'facebook.user_id': u'0192837465',
          u'my-own-customer-id': u'12345',
          u'twitter.id': u'1234987650'},
 'name': u'Johann Bernoulli',
 'routing_number': u'121000358',
 'updated_at': u'2014-01-27T22:56:25.767386Z'
})
% endif