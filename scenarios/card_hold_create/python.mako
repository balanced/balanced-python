% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC2abDOQVm5aNFhHpcRvWS02')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
CardHold(
 'amount': 5000,
 'created_at': u'2014-01-27T22:56:49.446376Z',
 'currency': u'USD',
 'description': u'Some descriptive text for the debit in the dashboard',
 'expires_at': u'2014-02-03T22:56:50.793698Z',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/card_holds/HL2ncCO5Bir2S0PCdsDHV3cG',
 'id': u'HL2ncCO5Bir2S0PCdsDHV3cG',
 'links': {u'card': u'CC2abDOQVm5aNFhHpcRvWS02', u'debit': None},
 'meta': {},
 'transaction_number': u'HL102-313-8003',
 'updated_at': u'2014-01-27T22:56:51.115729Z')
 
% endif