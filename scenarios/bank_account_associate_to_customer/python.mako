% if mode == 'definition':
balanced.BankAccount().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN')
bank_account.associate_to_customer('/customers/CU3o1ZAd8Gtxz6ZTIFK9YmsM')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'bank_account_verification': None}, can_credit=True, created_at=u'2015-01-09T03:23:24.352488Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2015-01-09T03:23:25.100561Z', href=u'/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA45anEaEr8g0lOhzhcE9VAN')
% endif