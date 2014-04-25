% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4joUazeM3BJE6emmv2Q8EF')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC4auQXiAWMBxJcEUIMYeZFj', u'debit': None}, amount=5000, created_at=u'2014-04-25T20:09:48.990540Z', updated_at=u'2014-04-25T20:09:49.731653Z', expires_at=u'2014-05-02T20:09:49.096484Z', failure_reason=None, currency=u'USD', transaction_number=u'HL161-849-8610', href=u'/card_holds/HL4joUazeM3BJE6emmv2Q8EF', meta={}, failure_reason_code=None, voided_at=u'2014-04-25T20:09:49.731656Z', id=u'HL4joUazeM3BJE6emmv2Q8EF')
% endif