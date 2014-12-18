% if mode == 'definition':
balanced.Debit().dispute

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

debit = balanced.Debit.fetch('/debits/WD6NY7W6uBFngNyBLqyhPBPv')
dispute = debit.dispute
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WD6NY7W6uBFngNyBLqyhPBPv'}, respond_by=u'2015-01-16T00:37:26.830823Z', amount=5000, created_at=u'2014-12-17T00:39:24.356634Z', updated_at=u'2014-12-17T00:39:24.356636Z', initiated_at=u'2014-12-17T00:37:26.830821Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT77EXjNYPh6qd8xErxOhHao', meta={}, id=u'DT77EXjNYPh6qd8xErxOhHao')
% endif