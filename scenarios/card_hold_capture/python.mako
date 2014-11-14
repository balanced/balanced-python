% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card_hold = balanced.CardHold.fetch('/card_holds/HL2F8jlnySjVKidwfXgBYZMY')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC2E1bHjwNbYtzUcTAmH4kEM', u'dispute': None, u'order': None, u'card_hold': u'HL2F8jlnySjVKidwfXgBYZMY'}, amount=5000, created_at=u'2014-11-14T19:28:39.577643Z', updated_at=u'2014-11-14T19:28:44.346481Z', failure_reason=None, currency=u'USD', transaction_number=u'W8L2-II6-ANHK', href=u'/debits/WD2Ne8ZvXt0FRckpr1JQ1eRq', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD2Ne8ZvXt0FRckpr1JQ1eRq')
% endif