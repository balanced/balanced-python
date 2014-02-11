% if mode == 'definition':
balanced.BankAccount().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount(
  routing_number='121000358',
  type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
).save()
% elif mode == 'response':
BankAccount(
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
 'created_at': u'2014-01-27T22:57:47.772481Z',
 'fingerprint': u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14',
 'href': u'/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0',
 'id': u'BA3qNbYRqFM0Q7MXn3IcjGl0',
 'links': {u'bank_account_verification': None, u'customer': None},
 'meta': {},
 'name': u'Johann Bernoulli',
 'routing_number': u'121000358',
 'updated_at': u'2014-01-27T22:57:47.772483Z')
 
% endif