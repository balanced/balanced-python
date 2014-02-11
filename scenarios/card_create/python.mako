% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card(
  expiration_month='12',
  security_code='123',
  number='5105105105105100',
  expiration_year='2020'
).save()
% elif mode == 'response':
Card(**{
 'address': {u'city': None,
             u'country_code': None,
             u'line1': None,
             u'line2': None,
             u'postal_code': None,
             u'state': None},
 'avs_postal_match': None,
 'avs_result': None,
 'avs_street_match': None,
 'brand': u'MasterCard',
 'created_at': u'2014-01-27T22:57:42.092923Z',
 'cvv': None,
 'cvv_match': None,
 'cvv_result': None,
 'expiration_month': 12,
 'expiration_year': 2020,
 'fingerprint': u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788',
 'href': u'/cards/CC3kqm84fxh50avenrUsSKbu',
 'id': u'CC3kqm84fxh50avenrUsSKbu',
 'is_verified': True,
 'links': {u'customer': None},
 'meta': {},
 'name': None,
 'number': u'xxxxxxxxxxxx5100',
 'updated_at': u'2014-01-27T22:57:42.092926Z'
})
% endif