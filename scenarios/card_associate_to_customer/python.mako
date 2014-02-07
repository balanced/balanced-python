% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC3kqm84fxh50avenrUsSKbu')
card.associate_to_customer('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
% elif mode == 'response':
{u'cvv_match': None, u'links': {u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg'}, u'expiration_year': 2020, u'avs_street_match': None, u'is_verified': True, u'created_at': u'2014-01-27T22:57:42.092923Z', u'cvv_result': None, u'brand': u'MasterCard', u'number': u'xxxxxxxxxxxx5100', u'updated_at': u'2014-01-27T22:57:42.724392Z', u'id': u'CC3kqm84fxh50avenrUsSKbu', u'expiration_month': 12, u'cvv': None, u'href': u'/cards/CC3kqm84fxh50avenrUsSKbu', u'meta': {}, u'address': {u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, u'fingerprint': u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', u'avs_postal_match': None, u'avs_result': None, u'name': None}
% endif