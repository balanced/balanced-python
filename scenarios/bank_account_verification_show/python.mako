% if mode == 'definition':
balanced.BankAccountVerification.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')
verification = balanced.BankAccountVerification.fetch('/verifications/BZ1FF2MHFH9upRu7C0QUwnby')
% elif mode == 'response':
BankAccountVerification(verification_status=u'pending', links={u'bank_account': u'BA1D3vL3LjasB0kewMqRGI0S'}, created_at=u'2014-01-27T22:56:10.726455Z', attempts_remaining=3, updated_at=u'2014-01-27T22:56:12.545750Z', deposit_status=u'succeeded', attempts=0, href=u'/verifications/BZ1FF2MHFH9upRu7C0QUwnby', meta={}, id=u'BZ1FF2MHFH9upRu7C0QUwnby')
% endif