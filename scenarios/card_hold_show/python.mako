% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4bdnO7ELS2JfyJ2T8elYOl')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC4auQXiAWMBxJcEUIMYeZFj', u'debit': None}, amount=5000, created_at=u'2014-04-25T20:09:41.712497Z', updated_at=u'2014-04-25T20:09:42.023214Z', expires_at=u'2014-05-02T20:09:41.878825Z', failure_reason=None, currency=u'USD', transaction_number=u'HL244-046-8353', href=u'/card_holds/HL4bdnO7ELS2JfyJ2T8elYOl', meta={}, failure_reason_code=None, voided_at=None, id=u'HL4bdnO7ELS2JfyJ2T8elYOl')
% endif