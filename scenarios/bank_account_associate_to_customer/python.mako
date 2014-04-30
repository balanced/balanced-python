% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/bank_accounts/BA7zu6QXmylsn0o6qVpS8UO9')
card.associate_to_customer('/customers/CU7yCmXG2RxyyIkcHG3SIMUF')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': u'CU7yCmXG2RxyyIkcHG3SIMUF', u'bank_account_verification': None}, can_credit=True, created_at=u'2014-04-25T22:00:11.119953Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-04-25T22:00:11.625350Z', href=u'/bank_accounts/BA7zu6QXmylsn0o6qVpS8UO9', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA7zu6QXmylsn0o6qVpS8UO9')
% endif