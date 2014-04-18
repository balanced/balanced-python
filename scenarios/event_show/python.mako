% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

event = balanced.Event.fetch('/events/EVfbb73252c68011e3bb20061e5f402045')
% elif mode == 'response':
Event(links={}, occurred_at=u'2014-04-17T22:38:35.758000Z', entity={u'customers': [{u'name': u'William Henry Cavendish III', u'links': {u'source': None, u'destination': None}, u'updated_at': u'2014-04-17T22:38:35.758188Z', u'created_at': u'2014-04-17T22:38:35.705116Z', u'dob_month': 2, u'merchant_status': u'underwritten', u'id': u'CU7EYury1BOjhbW83bqFKfVr', u'phone': u'+16505551212', u'href': u'/customers/CU7EYury1BOjhbW83bqFKfVr', u'meta': {}, u'dob_year': 1947, u'address': {u'city': u'Nowhere', u'line2': None, u'line1': None, u'state': None, u'postal_code': u'90210', u'country_code': u'USA'}, u'business_name': None, u'ssn_last4': u'xxxx', u'email': u'whc@example.org', u'ein': None}], u'links': {u'customers.source': u'/resources/{customers.source}', u'customers.card_holds': u'/customers/{customers.id}/card_holds', u'customers.cards': u'/customers/{customers.id}/cards', u'customers.debits': u'/customers/{customers.id}/debits', u'customers.destination': u'/resources/{customers.destination}', u'customers.external_accounts': u'/customers/{customers.id}/external_accounts', u'customers.bank_accounts': u'/customers/{customers.id}/bank_accounts', u'customers.transactions': u'/customers/{customers.id}/transactions', u'customers.refunds': u'/customers/{customers.id}/refunds', u'customers.reversals': u'/customers/{customers.id}/reversals', u'customers.orders': u'/customers/{customers.id}/orders', u'customers.credits': u'/customers/{customers.id}/credits'}}, href=u'/events/EVfbb73252c68011e3bb20061e5f402045', callback_statuses={u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 0}, type=u'account.created', id=u'EVfbb73252c68011e3bb20061e5f402045')
% endif