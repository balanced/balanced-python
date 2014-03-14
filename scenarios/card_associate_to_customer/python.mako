% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC68IoCVpoFlkugB7xt52p8C')
card.associate_to_customer('/customers/CU64R7DS6DwuXYVg9RTskFK8')
% elif mode == 'response':
Card(cvv_match=u'yes', links={u'customer': u'CU64R7DS6DwuXYVg9RTskFK8'}, expiration_year=2020, avs_street_match=None, avs_postal_match=None, created_at=u'2014-03-06T19:23:25.159503Z', cvv_result=u'Match', number=u'xxxxxxxxxxxx5100', updated_at=u'2014-03-06T19:23:25.633918Z', expiration_month=12, cvv=u'xxx', href=u'/cards/CC68IoCVpoFlkugB7xt52p8C', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CC68IoCVpoFlkugB7xt52p8C', fingerprint=u'fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788', is_verified=True, brand=u'MasterCard', name=None)
% endif