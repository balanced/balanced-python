% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4bdnO7ELS2JfyJ2T8elYOl')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'card': u'CC4auQXiAWMBxJcEUIMYeZFj', u'debit': None}, amount=5000, created_at=u'2014-04-25T20:09:41.712497Z', updated_at=u'2014-04-25T20:09:45.729280Z', expires_at=u'2014-05-02T20:09:41.878825Z', failure_reason=None, currency=u'USD', transaction_number=u'HL244-046-8353', href=u'/card_holds/HL4bdnO7ELS2JfyJ2T8elYOl', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL4bdnO7ELS2JfyJ2T8elYOl')
% endif