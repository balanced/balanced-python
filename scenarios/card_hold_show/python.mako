% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S')
% elif mode == 'response':
CardHold(
 'amount': 5000,
 'created_at': u'2014-01-27T22:56:39.379941Z',
 'currency': u'USD',
 'description': u'Some descriptive text for the debit in the dashboard',
 'expires_at': u'2014-02-03T22:56:39.876902Z',
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S',
 'id': u'HL2bT9uMRkTZkfSPmA2pBD9S',
 'links': {u'card': u'CC2abDOQVm5aNFhHpcRvWS02', u'debit': None},
 'meta': {},
 'transaction_number': u'HL500-842-5492',
 'updated_at': u'2014-01-27T22:56:40.238140Z')
 
% endif