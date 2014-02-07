% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

event = balanced.Event.fetch('/events/EV2abbb98487a611e3a86f026ba7d31e6f')
% elif mode == 'response':
{u'links': {}, u'occurred_at': u'2014-01-27T22:55:50.767000Z', u'entity': {u'customers': [{u'name': None, u'links': {u'source': None, u'destination': None}, u'updated_at': u'2014-01-27T22:55:50.767858Z', u'created_at': u'2014-01-27T22:55:50.253066Z', u'dob_month': None, u'merchant_status': u'no-match', u'id': u'CU1iDnBalzHoZg47Np92rNrV', u'phone': None, u'href': u'/customers/CU1iDnBalzHoZg47Np92rNrV', u'meta': {}, u'dob_year': None, u'address': {u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, u'business_name': None, u'ssn_last4': None, u'email': None, u'ein': None}], u'links': {u'customers.source': u'/resources/{customers.source}', u'customers.card_holds': u'/customers/{customers.id}/card_holds', u'customers.cards': u'/customers/{customers.id}/cards', u'customers.debits': u'/customers/{customers.id}/debits', u'customers.destination': u'/resources/{customers.destination}', u'customers.bank_accounts': u'/customers/{customers.id}/bank_accounts', u'customers.transactions': u'/customers/{customers.id}/transactions', u'customers.refunds': u'/customers/{customers.id}/refunds', u'customers.reversals': u'/customers/{customers.id}/reversals', u'customers.orders': u'/customers/{customers.id}/orders', u'customers.credits': u'/customers/{customers.id}/credits'}}, u'href': u'/events/EV2abbb98487a611e3a86f026ba7d31e6f', u'callback_statuses': {u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 0}, u'type': u'account.created', u'id': u'EV2abbb98487a611e3a86f026ba7d31e6f'}
% endif