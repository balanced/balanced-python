% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S')
% elif mode == 'response':
CardHold(description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC2abDOQVm5aNFhHpcRvWS02', u'debit': None}, amount=5000, created_at=u'2014-01-27T22:56:39.379941Z', updated_at=u'2014-01-27T22:56:40.238140Z', expires_at=u'2014-02-03T22:56:39.876902Z', failure_reason=None, currency=u'USD', transaction_number=u'HL500-842-5492', href=u'/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S', meta={}, failure_reason_code=None, id=u'HL2bT9uMRkTZkfSPmA2pBD9S')
% endif