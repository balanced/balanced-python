% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL3QlUen3sZjc3dPbgK40F7G')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC2IDFuWSoETEIxLBJ73fXgs', u'dispute': None, u'order': None, u'card_hold': u'HL3QlUen3sZjc3dPbgK40F7G'}, amount=5000, created_at=u'2014-12-18T18:22:00.112797Z', updated_at=u'2014-12-18T18:22:00.567201Z', failure_reason=None, currency=u'USD', transaction_number=u'WNAL-WT0-4MAN', href=u'/debits/WD40z3S2aPc8buLNd8kYg4hi', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD40z3S2aPc8buLNd8kYg4hi')
% endif