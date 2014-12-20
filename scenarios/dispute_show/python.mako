% if mode == 'definition':
balanced.Dispute.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

dispute = balanced.Dispute.fetch('/disputes/DT4WXjGGzPSsqYuPfWaKHDsf')
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WD4QE0i532v0eWQ6mCWCASc5'}, respond_by=u'2015-01-17T18:21:02.819478Z', amount=5000, created_at=u'2014-12-18T18:22:52.051775Z', updated_at=u'2014-12-18T18:22:52.051777Z', initiated_at=u'2014-12-18T18:21:02.819475Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT4WXjGGzPSsqYuPfWaKHDsf', meta={}, id=u'DT4WXjGGzPSsqYuPfWaKHDsf')
% endif