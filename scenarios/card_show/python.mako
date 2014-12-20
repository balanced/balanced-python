% if mode == 'definition':
balanced.Card.fetch()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card = balanced.Card.fetch('/cards/CC48j1De9eVYELLivrgDeCM8')
% elif mode == 'response':
Card(links={u'customer': None}, cvv_result=u'Match', number=u'xxxxxxxxxxxx5100', expiration_month=12, href=u'/cards/CC48j1De9eVYELLivrgDeCM8', type=u'credit', id=u'CC48j1De9eVYELLivrgDeCM8', category=u'other', is_verified=True, cvv_match=u'yes', bank_name=u'BANK OF HAWAII', avs_street_match=None, brand=u'MasterCard', updated_at=u'2014-12-18T18:22:06.996162Z', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', can_debit=True, name=None, expiration_year=2020, cvv=u'xxx', avs_postal_match=None, avs_result=None, can_credit=False, meta={}, created_at=u'2014-12-18T18:22:06.996160Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None})
% endif