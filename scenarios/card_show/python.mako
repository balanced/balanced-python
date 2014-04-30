% if mode == 'definition':
balanced.Card.fetch()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/cards/CC832pqCbRPor1ewRdxPvnv')
% elif mode == 'response':
Card(cvv_match=u'yes', links={u'customer': None}, expiration_year=2020, avs_street_match=None, avs_postal_match=None, created_at=u'2014-04-25T22:00:30.351615Z', cvv_result=u'Match', number=u'xxxxxxxxxxxx5100', updated_at=u'2014-04-25T22:00:30.351617Z', expiration_month=12, cvv=u'xxx', href=u'/cards/CC832pqCbRPor1ewRdxPvnv', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CC832pqCbRPor1ewRdxPvnv', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', is_verified=True, brand=u'MasterCard', name=None)
% endif