% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4auQXiAWMBxJcEUIMYeZFj')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC4auQXiAWMBxJcEUIMYeZFj', u'debit': None}, amount=5000, created_at=u'2014-04-25T20:09:48.990540Z', updated_at=u'2014-04-25T20:09:49.228091Z', expires_at=u'2014-05-02T20:09:49.096484Z', failure_reason=None, currency=u'USD', transaction_number=u'HL161-849-8610', href=u'/card_holds/HL4joUazeM3BJE6emmv2Q8EF', meta={}, failure_reason_code=None, voided_at=None, id=u'HL4joUazeM3BJE6emmv2Q8EF')
% endif