% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card_hold = balanced.CardHold.fetch('/card_holds/HLqY5FcrUWcnBzMkHpKK1WB')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'card': u'CCCk1CEzUN0gDA5qh8um0rv', u'debit': None}, amount=5000, created_at=u'2014-04-17T22:39:06.875506Z', updated_at=u'2014-04-17T22:39:10.767779Z', expires_at=u'2014-04-24T22:39:06.984691Z', failure_reason=None, currency=u'USD', transaction_number=u'HL019-852-0737', href=u'/card_holds/HLqY5FcrUWcnBzMkHpKK1WB', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HLqY5FcrUWcnBzMkHpKK1WB')
% endif