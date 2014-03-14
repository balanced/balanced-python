% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA58WYAEUMrEtAkW5KAvWo5V')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()
% elif mode == 'response':
BankAccount(routing_number=u'121000358', bank_name=u'BANK OF AMERICA, N.A.', account_type=u'checking', name=u'Johann Bernoulli', links={u'customer': None, u'bank_account_verification': None}, can_credit=True, created_at=u'2014-03-06T19:22:30.247406Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, updated_at=u'2014-03-06T19:22:33.744499Z', href=u'/bank_accounts/BA58WYAEUMrEtAkW5KAvWo5V', meta={u'twitter.id': u'1234987650', u'facebook.user_id': u'0192837465', u'my-own-customer-id': u'12345'}, account_number=u'xxxxxx0001', fingerprint=u'5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14', can_debit=False, id=u'BA58WYAEUMrEtAkW5KAvWo5V')
% endif