% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card_hold = balanced.CardHold.fetch('/card_holds/HLqY5FcrUWcnBzMkHpKK1WB')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CCCk1CEzUN0gDA5qh8um0rv', u'debit': None}, amount=5000, created_at=u'2014-04-17T22:39:06.875506Z', updated_at=u'2014-04-17T22:39:07.063348Z', expires_at=u'2014-04-24T22:39:06.984691Z', failure_reason=None, currency=u'USD', transaction_number=u'HL019-852-0737', href=u'/card_holds/HLqY5FcrUWcnBzMkHpKK1WB', meta={}, failure_reason_code=None, voided_at=None, id=u'HLqY5FcrUWcnBzMkHpKK1WB')
% endif