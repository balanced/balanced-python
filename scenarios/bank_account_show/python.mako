% if mode == 'definition':
balanced.BankAccount.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4GVxlUHmn8y0CjAUEcW6Kp')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': None, u'bank_account_verification': None}, can_credit=True, created_at=u'2014-12-17T00:37:10.306239Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-12-17T00:37:10.306241Z', href=u'/bank_accounts/BA4GVxlUHmn8y0CjAUEcW6Kp', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA4GVxlUHmn8y0CjAUEcW6Kp')
% endif