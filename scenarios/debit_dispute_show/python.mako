% if mode == 'definition':
balanced.Debit().dispute

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

debit = balanced.Debit.fetch('/debits/WD5SwXr9jcCfCmmjTH5MCMFD')
dispute = debit.dispute
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WD5SwXr9jcCfCmmjTH5MCMFD'}, respond_by=u'2015-02-08T03:22:35.440841Z', amount=5000, created_at=u'2015-01-09T03:25:14.170586Z', updated_at=u'2015-01-09T03:25:14.170588Z', initiated_at=u'2015-01-09T03:22:35.440838Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT64FIXm5agnVqfCMHZVe8dR', meta={}, id=u'DT64FIXm5agnVqfCMHZVe8dR')
% endif