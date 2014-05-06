% if mode == 'definition':
balanced.Dispute.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

dispute = balanced.Dispute.fetch('/disputes/DT180PABUUjnj5wdE2pcwXQD')
% elif mode == 'response':
Dispute(status=u'pending', links={u'transaction': u'WDJ66VlXnDyDx5AS5uplxyt'}, respond_by=u'2014-05-25T22:01:03.776578Z', amount=5000, created_at=u'2014-04-25T22:08:34.942433Z', updated_at=u'2014-04-25T22:08:34.942442Z', initiated_at=u'2014-04-25T22:01:03.776574Z', currency=u'USD', reason=u'fraud', href=u'/disputes/DT180PABUUjnj5wdE2pcwXQD', meta={}, id=u'DT180PABUUjnj5wdE2pcwXQD')
% endif