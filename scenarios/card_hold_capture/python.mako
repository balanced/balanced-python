% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5wAfv8JaMsEn9idXrLZZZT')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU4Wt8xSbREzV2NWtdVAFGeR', u'source': u'CC5nCSU0yFp3qxR4p6UZST7y', u'order': None, u'dispute': None}, amount=5000, created_at=u'2014-03-06T19:22:49.584629Z', updated_at=u'2014-03-06T19:22:50.608819Z', failure_reason=None, currency=u'USD', transaction_number=u'W493-697-4873', href=u'/debits/WD5Co9XwRZJg1QtvC5QeekhX', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD5Co9XwRZJg1QtvC5QeekhX')
% endif