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
{u'routing_number': u'121000358', u'bank_name': u'BANK OF AMERICA, N.A.', u'account_type': u'checking', u'name': u'Johann Bernoulli', u'links': {u'customer': None, u'bank_account_verification': None}, u'can_credit': True, u'created_at': u'2014-01-27T22:57:47.772481Z', u'fingerprint': u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', u'updated_at': u'2014-01-27T22:57:47.772483Z', u'href': u'/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0', u'meta': {}, u'account_number': u'xxxxxx0001', u'address': {u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, u'can_debit': False, u'id': u'BA3qNbYRqFM0Q7MXn3IcjGl0'}
% endif