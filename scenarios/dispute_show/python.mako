% if mode == 'definition':
balanced.Dispute.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

dispute = balanced.Dispute.fetch('/disputes/DT1yIxVolzxscHl6rGUhtTDw')
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WD1qIcVqGE1JrqFJuHH0d1pf'}, respond_by=u'2014-05-17T00:00:00Z', amount=5000, created_at=u'2014-04-17T22:39:53.381467Z', updated_at=u'2014-04-17T22:39:53.381469Z', initiated_at=u'2014-04-17T00:00:00Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT1yIxVolzxscHl6rGUhtTDw', meta={}, id=u'DT1yIxVolzxscHl6rGUhtTDw')
% endif