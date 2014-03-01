% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC3kqm84fxh50avenrUsSKbu')
card.associate_to_customer('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
% elif mode == 'response':
Card(cvv_match=None, links={u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg'}, expiration_year=2020, avs_street_match=None, avs_postal_match=None, created_at=u'2014-01-27T22:57:42.092923Z', cvv_result=None, number=u'xxxxxxxxxxxx5100', updated_at=u'2014-01-27T22:57:42.724392Z', expiration_month=12, cvv=None, href=u'/cards/CC3kqm84fxh50avenrUsSKbu', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CC3kqm84fxh50avenrUsSKbu', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', is_verified=True, brand=u'MasterCard', name=None)
% endif