% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2ncCO5Bir2S0PCdsDHV3cG')
card_hold.cancel()
% elif mode == 'response':
{u'description': u'Some descriptive text for the debit in the dashboard', u'links': {u'card': u'CC2abDOQVm5aNFhHpcRvWS02', u'debit': None}, u'updated_at': u'2014-01-27T22:56:51.686616Z', u'created_at': u'2014-01-27T22:56:49.446376Z', u'transaction_number': u'HL102-313-8003', u'expires_at': u'2014-02-03T22:56:50.793698Z', u'failure_reason': None, u'currency': u'USD', u'amount': 5000, u'href': u'/card_holds/HL2ncCO5Bir2S0PCdsDHV3cG', u'meta': {}, u'failure_reason_code': None, u'id': u'HL2ncCO5Bir2S0PCdsDHV3cG'}
% endif