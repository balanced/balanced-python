% if mode == 'definition':
balanced.Order().debit_from()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
card = balanced.Card.fetch('/cards/CC4zyuNpxY0A0eAf87SeULCR')
order.debit_from(
    amount=5000,
    source=card,
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Order #12341234', links={u'customer': None, u'source': u'CC4zyuNpxY0A0eAf87SeULCR', u'dispute': None, u'order': u'OR3vURGwVtqDnnkRS9fgH41G', u'card_hold': u'HL4JLr6FnToEyeoEdOCOTpC5'}, amount=5000, created_at=u'2015-01-09T03:24:00.472796Z', updated_at=u'2015-01-09T03:24:01.120118Z', failure_reason=None, currency=u'USD', transaction_number=u'W2W2-G3K-YCMU', href=u'/debits/WD4JMhEQTuXpqzpBvpgDo633', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*example.com', id=u'WD4JMhEQTuXpqzpBvpgDo633')
% endif