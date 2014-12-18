% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

event = balanced.Event.fetch('/events/EV8099fafa858411e4b4d3061e5f402045')
% elif mode == 'response':
Event(links={}, occurred_at=u'2014-12-17T00:36:27.823872Z', entity={u'card_holds': [{u'status': u'succeeded', u'description': None, u'links': {u'order': None, u'card': u'CC3Tqdf2yJVN6yAyU0yyCqSp', u'debit': u'WD3Ugq3inzt4NmATDCnE4GS9'}, u'updated_at': u'2014-12-17T00:36:27.823872Z', u'created_at': u'2014-12-17T00:36:27.014576Z', u'transaction_number': u'HL7UY-6EB-QGLI', u'expires_at': u'2014-12-24T00:36:27.304908Z', u'failure_reason': None, u'currency': u'USD', u'amount': 10000000, u'href': u'/card_holds/HL3UeNb51Pj3QkER6bIQnGbH', u'meta': {}, u'failure_reason_code': None, u'voided_at': None, u'id': u'HL3UeNb51Pj3QkER6bIQnGbH'}], u'links': {u'card_holds.order': u'/orders/{card_holds.order}', u'card_holds.events': u'/card_holds/{card_holds.id}/events', u'card_holds.card': u'/cards/{card_holds.card}', u'card_holds.debit': u'/debits/{card_holds.debit}', u'card_holds.debits': u'/card_holds/{card_holds.id}/debits'}}, href=u'/events/EV8099fafa858411e4b4d3061e5f402045', callback_statuses={u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 0}, type=u'hold.updated', id=u'EV8099fafa858411e4b4d3061e5f402045')
% endif