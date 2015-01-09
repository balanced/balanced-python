% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_hold = balanced.CardHold.fetch('/card_holds/HL4iHX8OBNW7nVsu6MqyjnQ9')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC3vhL91rWtwtHcOBl0ITshG', u'dispute': None, u'order': None, u'card_hold': u'HL4iHX8OBNW7nVsu6MqyjnQ9'}, amount=5000, created_at=u'2015-01-09T03:23:43.969240Z', updated_at=u'2015-01-09T03:23:44.454341Z', failure_reason=None, currency=u'USD', transaction_number=u'W456-5GN-9ECN', href=u'/debits/WD4relmrBWDQmtlKKKmKLi7z', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD4relmrBWDQmtlKKKmKLi7z')
% endif