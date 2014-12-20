% if mode == 'definition':
balanced.BankAccount().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY')
bank_account.associate_to_customer('/customers/CU2DRnwOXfbxBlKb5CUWwWJi')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': u'CU2DRnwOXfbxBlKb5CUWwWJi', u'bank_account_verification': None}, can_credit=True, created_at=u'2014-12-18T18:21:31.663217Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-12-18T18:21:32.166444Z', href=u'/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA3uzbngfVXy1SGg25Et7iKY')
% endif