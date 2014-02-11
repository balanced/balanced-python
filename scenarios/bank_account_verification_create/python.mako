% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1D3vL3LjasB0kewMqRGI0S')
verification = bank_account.verify()
% elif mode == 'response':
BankAccountVerification(**{
 'attempts': 0,
 'attempts_remaining': 3,
 'created_at': u'2014-01-27T22:56:10.726455Z',
 'deposit_status': u'succeeded',
 'href': u'/verifications/BZ1FF2MHFH9upRu7C0QUwnby',
 'id': u'BZ1FF2MHFH9upRu7C0QUwnby',
 'links': {u'bank_account': u'BA1D3vL3LjasB0kewMqRGI0S'},
 'meta': {},
 'updated_at': u'2014-01-27T22:56:12.545750Z',
 'verification_status': u'pending'
})
% endif