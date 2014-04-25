% if mode == 'definition':
balanced.Dispute.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

dispute = balanced.Dispute.fetch('/disputes/DT61IA2iRqyYBLqUCJNt5XNV')
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WD4YCKAyFrQBFYuFCUCRynOx'}, respond_by=u'2014-05-25T20:10:26.554061Z', amount=5000, created_at=u'2014-04-25T20:18:33.022136Z', updated_at=u'2014-04-25T20:18:33.022139Z', initiated_at=u'2014-04-25T20:10:26.554057Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT61IA2iRqyYBLqUCJNt5XNV', meta={}, id=u'DT61IA2iRqyYBLqUCJNt5XNV')
% endif