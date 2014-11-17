% if mode == 'definition':
balanced.BankAccount().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA2gul8YMjFWnFk0fFHXwX6g')
bank_account.associate_to_customer('/customers/CU2718cI8PkMdFyPjboZLZfn')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': u'CU2718cI8PkMdFyPjboZLZfn', u'bank_account_verification': None}, can_credit=True, created_at=u'2014-11-14T19:28:10.468801Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-11-14T19:28:11.068363Z', href=u'/bank_accounts/BA2gul8YMjFWnFk0fFHXwX6g', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA2gul8YMjFWnFk0fFHXwX6g')
% endif