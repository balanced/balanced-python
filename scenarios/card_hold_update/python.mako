% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card_hold = balanced.CardHold.fetch('/card_holds/HL5gGjFGvSfw0pkPB93SnYze')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'order': None, u'card': u'CC47wPIfNkploi0BbLRDqEYo', u'debit': None}, amount=5000, created_at=u'2014-12-17T00:37:42.094383Z', updated_at=u'2014-12-17T00:37:48.967489Z', expires_at=u'2014-12-24T00:37:42.323001Z', failure_reason=None, currency=u'USD', transaction_number=u'HLQJA-8RL-50JI', href=u'/card_holds/HL5gGjFGvSfw0pkPB93SnYze', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL5gGjFGvSfw0pkPB93SnYze')
% endif