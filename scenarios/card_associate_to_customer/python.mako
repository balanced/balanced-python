% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4tvKLTKXcBJAgkGvPEW58N')
card.associate_to_customer('/customers/CU3VYCUIfwngJsidJWdGw2W5')
% elif mode == 'response':
Card(cvv_match=u'yes', links={u'customer': u'CU3VYCUIfwngJsidJWdGw2W5'}, expiration_year=2020, avs_street_match=None, avs_postal_match=None, created_at=u'2014-04-25T20:09:57.984444Z', cvv_result=u'Match', number=u'xxxxxxxxxxxx5100', updated_at=u'2014-04-25T20:09:58.467948Z', expiration_month=12, cvv=u'xxx', href=u'/cards/CC4tvKLTKXcBJAgkGvPEW58N', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CC4tvKLTKXcBJAgkGvPEW58N', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', is_verified=True, brand=u'MasterCard', name=None)
% endif