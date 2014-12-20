% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

event = balanced.Event.fetch('/events/EV81a73c0a86e211e496f002e66206bf80')
% elif mode == 'response':
Event(links={}, occurred_at=u'2014-12-18T18:21:57.034130Z', entity={u'debits': [{u'status': u'succeeded', u'description': None, u'links': {u'customer': u'CU2sWdT0agfxWIbJN2W5LR0k', u'source': u'CC2u8eJDeFlT9Cw2t9IBN1lz', u'dispute': None, u'order': None, u'card_hold': u'HL3WaWNMhbQ2dPNYkY2GlaUg'}, u'href': u'/debits/WD3Wcqqml6qjXXs5TvAv0Woo', u'created_at': u'2014-12-18T18:21:56.238975Z', u'transaction_number': u'WQKG-WID-ZHC9', u'failure_reason': None, u'updated_at': u'2014-12-18T18:21:57.034130Z', u'currency': u'USD', u'amount': 10000000, u'failure_reason_code': None, u'meta': {}, u'appears_on_statement_as': u'BAL*example.com', u'id': u'WD3Wcqqml6qjXXs5TvAv0Woo'}], u'links': {u'debits.customer': u'/customers/{debits.customer}', u'debits.dispute': u'/disputes/{debits.dispute}', u'debits.card_hold': u'/holds/{debits.card_hold}', u'debits.source': u'/resources/{debits.source}', u'debits.order': u'/orders/{debits.order}', u'debits.refunds': u'/debits/{debits.id}/refunds', u'debits.events': u'/debits/{debits.id}/events'}}, href=u'/events/EV81a73c0a86e211e496f002e66206bf80', callback_statuses={u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 1}, type=u'debit.created', id=u'EV81a73c0a86e211e496f002e66206bf80')
% endif