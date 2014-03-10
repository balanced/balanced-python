% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(description=u'update this description', links={u'card': u'CC2abDOQVm5aNFhHpcRvWS02', u'debit': None}, amount=5000, created_at=u'2014-01-27T22:56:39.379941Z', updated_at=u'2014-01-27T22:56:44.255042Z', expires_at=u'2014-02-03T22:56:39.876902Z', failure_reason=None, currency=u'USD', transaction_number=u'HL500-842-5492', href=u'/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, id=u'HL2bT9uMRkTZkfSPmA2pBD9S')
% endif