% if mode == 'definition':
balanced.Card.fetch()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4mYF7dj7X6OA2K5F0Qyb4N')
% elif mode == 'response':
Card(cvv_match=u'yes', links={u'customer': None}, expiration_year=2020, avs_street_match=None, avs_postal_match=None, created_at=u'2014-04-25T20:09:52.175221Z', cvv_result=u'Match', number=u'xxxxxxxxxxxx5100', updated_at=u'2014-04-25T20:09:52.175224Z', expiration_month=12, cvv=u'xxx', href=u'/cards/CC4mYF7dj7X6OA2K5F0Qyb4N', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CC4mYF7dj7X6OA2K5F0Qyb4N', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', is_verified=True, brand=u'MasterCard', name=None)
% endif