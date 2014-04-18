% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/bank_accounts/BAscOV2erMwv3yhIb5sFTaV')
card.associate_to_customer('/customers/CUeXNjpejPooRtSnJLc6SRD')
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': u'CUeXNjpejPooRtSnJLc6SRD', u'bank_account_verification': None}, can_credit=True, created_at=u'2014-04-17T22:38:57.291677Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-04-17T22:38:57.745100Z', href=u'/bank_accounts/BAscOV2erMwv3yhIb5sFTaV', meta={}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BAscOV2erMwv3yhIb5sFTaV')
% endif