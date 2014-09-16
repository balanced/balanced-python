% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4io3nFmawRhnkkUWnC1Eoo')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC4hAPsanjFP7QWIIAAPAwKh', u'dispute': None, u'order': None, u'card_hold': u'HL4io3nFmawRhnkkUWnC1Eoo'}, amount=5000, created_at=u'2014-09-02T18:25:51.872425Z', updated_at=u'2014-09-02T18:26:00.911999Z', failure_reason=None, currency=u'USD', transaction_number=u'WH9W-VKH-QB1V', href=u'/debits/WD4r75TJSiVaTKmiASslPIR7', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ShowsUpOnStmt', id=u'WD4r75TJSiVaTKmiASslPIR7')
% endif