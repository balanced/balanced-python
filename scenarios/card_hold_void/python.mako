% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_hold = balanced.CardHold.fetch('/card_holds/HL4u4T2877PfgYwnbhD2XweV')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC3vhL91rWtwtHcOBl0ITshG', u'debit': None}, amount=5000, created_at=u'2015-01-09T03:23:46.500278Z', updated_at=u'2015-01-09T03:23:47.578727Z', expires_at=u'2015-01-16T03:23:46.699907Z', failure_reason=None, currency=u'USD', transaction_number=u'HL07I-F9N-OVPO', href=u'/card_holds/HL4u4T2877PfgYwnbhD2XweV', meta={}, failure_reason_code=None, voided_at=u'2015-01-09T03:23:47.257558Z', id=u'HL4u4T2877PfgYwnbhD2XweV')
% endif