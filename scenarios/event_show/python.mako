% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

event = balanced.Event.fetch('/events/EVc7cbc12497ae11e48e4606debca797bb')
% elif mode == 'response':
Event(links={}, occurred_at=u'2015-01-09T03:25:04.090381Z', entity={u'debits': [{u'status': u'succeeded', u'description': u'Some descriptive text for the debit in the dashboard', u'links': {u'customer': None, u'source': u'CC5RRvpnZIg0PWdSphR8xxPa', u'dispute': u'DT64FIXm5agnVqfCMHZVe8dR', u'order': None, u'card_hold': u'HL5Svbmw6nDDP5HO2RblsBCJ'}, u'href': u'/debits/WD5SwXr9jcCfCmmjTH5MCMFD', u'created_at': u'2015-01-09T03:25:03.383375Z', u'transaction_number': u'WA4K-D44-O5DR', u'failure_reason': None, u'updated_at': u'2015-01-09T03:25:04.090381Z', u'currency': u'USD', u'amount': 5000, u'failure_reason_code': None, u'meta': {}, u'appears_on_statement_as': u'BAL*Statement text', u'id': u'WD5SwXr9jcCfCmmjTH5MCMFD'}], u'links': {u'debits.customer': u'/customers/{debits.customer}', u'debits.dispute': u'/disputes/{debits.dispute}', u'debits.card_hold': u'/holds/{debits.card_hold}', u'debits.source': u'/resources/{debits.source}', u'debits.order': u'/orders/{debits.order}', u'debits.refunds': u'/debits/{debits.id}/refunds', u'debits.events': u'/debits/{debits.id}/events'}}, href=u'/events/EVc7cbc12497ae11e48e4606debca797bb', callback_statuses={u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 1}, type=u'debit.succeeded', id=u'EVc7cbc12497ae11e48e4606debca797bb')
% endif