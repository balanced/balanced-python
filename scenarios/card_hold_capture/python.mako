% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card_hold = balanced.CardHold.fetch('/card_holds/HLqY5FcrUWcnBzMkHpKK1WB')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU7EYury1BOjhbW83bqFKfVr', u'source': u'CCCk1CEzUN0gDA5qh8um0rv', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-04-17T22:39:11.899836Z', updated_at=u'2014-04-17T22:39:12.557109Z', failure_reason=None, currency=u'USD', transaction_number=u'W443-185-7401', href=u'/debits/WDIDzVvqKBTwEp0GJ4gNBu9', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WDIDzVvqKBTwEp0GJ4gNBu9')
% endif