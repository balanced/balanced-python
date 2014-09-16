% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4io3nFmawRhnkkUWnC1Eoo')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC4hAPsanjFP7QWIIAAPAwKh', u'debit': None}, amount=5000, created_at=u'2014-09-02T18:25:44.114448Z', updated_at=u'2014-09-02T18:25:46.117246Z', expires_at=u'2014-09-09T18:25:44.889479Z', failure_reason=None, currency=u'USD', transaction_number=u'HLOUQ-V39-L4PE', href=u'/card_holds/HL4io3nFmawRhnkkUWnC1Eoo', meta={}, failure_reason_code=None, voided_at=None, id=u'HL4io3nFmawRhnkkUWnC1Eoo')
% endif