% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

event = balanced.Event.fetch('/events/EV2abbb98487a611e3a86f026ba7d31e6f')
% elif mode == 'response':
Event(**{
 'callback_statuses': {u'failed': 0,
                       u'pending': 0,
                       u'retrying': 0,
                       u'succeeded': 0},
 'entity': {u'customers': [{u'address': {u'city': None,
                                         u'country_code': None,
                                         u'line1': None,
                                         u'line2': None,
                                         u'postal_code': None,
                                         u'state': None},
                            u'business_name': None,
                            u'created_at': u'2014-01-27T22:55:50.253066Z',
                            u'dob_month': None,
                            u'dob_year': None,
                            u'ein': None,
                            u'email': None,
                            u'href': u'/customers/CU1iDnBalzHoZg47Np92rNrV',
                            u'id': u'CU1iDnBalzHoZg47Np92rNrV',
                            u'links': {u'destination': None,
                                       u'source': None},
                            u'merchant_status': u'no-match',
                            u'meta': {},
                            u'name': None,
                            u'phone': None,
                            u'ssn_last4': None,
                            u'updated_at': u'2014-01-27T22:55:50.767858Z'}],
            u'links': {u'customers.bank_accounts': u'/customers/{customers.id}/bank_accounts',
                       u'customers.card_holds': u'/customers/{customers.id}/card_holds',
                       u'customers.cards': u'/customers/{customers.id}/cards',
                       u'customers.credits': u'/customers/{customers.id}/credits',
                       u'customers.debits': u'/customers/{customers.id}/debits',
                       u'customers.destination': u'/resources/{customers.destination}',
                       u'customers.orders': u'/customers/{customers.id}/orders',
                       u'customers.refunds': u'/customers/{customers.id}/refunds',
                       u'customers.reversals': u'/customers/{customers.id}/reversals',
                       u'customers.source': u'/resources/{customers.source}',
                       u'customers.transactions': u'/customers/{customers.id}/transactions'}},
 'href': u'/events/EV2abbb98487a611e3a86f026ba7d31e6f',
 'id': u'EV2abbb98487a611e3a86f026ba7d31e6f',
 'links': {},
 'occurred_at': u'2014-01-27T22:55:50.767000Z',
 'type': u'account.created'
})
% endif