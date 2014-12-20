% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL3QlUen3sZjc3dPbgK40F7G')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'order': None, u'card': u'CC2IDFuWSoETEIxLBJ73fXgs', u'debit': None}, amount=5000, created_at=u'2014-12-18T18:21:51.031249Z', updated_at=u'2014-12-18T18:21:57.707589Z', expires_at=u'2014-12-25T18:21:51.188658Z', failure_reason=None, currency=u'USD', transaction_number=u'HLJUR-14S-IVEC', href=u'/card_holds/HL3QlUen3sZjc3dPbgK40F7G', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL3QlUen3sZjc3dPbgK40F7G')
% endif