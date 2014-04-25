% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4bdnO7ELS2JfyJ2T8elYOl')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU3z3rwGWGazDwwyLy0rNqfj', u'source': u'CC4auQXiAWMBxJcEUIMYeZFj', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-25T20:09:46.854710Z', updated_at=u'2014-04-25T20:09:47.351487Z', failure_reason=None, currency=u'USD', transaction_number=u'W815-967-5010', href=u'/debits/WD4gZDOJ1DB443FYcbwNN5EV', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD4gZDOJ1DB443FYcbwNN5EV')
% endif