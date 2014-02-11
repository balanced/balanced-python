% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ1FF2MHFH9upRu7C0QUwnby')
verification.confirm(amount_1=1, amount_2=1)
% elif mode == 'response':
BankAccountVerification(
 'attempts': 1,
 'attempts_remaining': 2,
 'created_at': u'2014-01-27T22:56:10.726455Z',
 'deposit_status': u'succeeded',
 'href': u'/verifications/BZ1FF2MHFH9upRu7C0QUwnby',
 'id': u'BZ1FF2MHFH9upRu7C0QUwnby',
 'links': {u'bank_account': u'BA1D3vL3LjasB0kewMqRGI0S'},
 'meta': {},
 'updated_at': u'2014-01-27T22:56:18.631337Z',
 'verification_status': u'succeeded')
 
% endif