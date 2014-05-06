% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='6500000000000002',
  expiration_year='3000'
).save()
% elif mode == 'response':
Card(cvv_match=u'yes', links={u'customer': None}, expiration_year=3000, avs_street_match=None, avs_postal_match=None, created_at=u'2014-04-25T22:01:02.497846Z', cvv_result=u'Match', number=u'xxxxxxxxxxxx0002', updated_at=u'2014-04-25T22:01:02.497848Z', expiration_month=12, cvv=u'xxx', href=u'/cards/CCIcOaBZBsK9o6Nbqmuu7B3', meta={}, avs_result=None, address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, id=u'CCIcOaBZBsK9o6Nbqmuu7B3', fingerprint=u'3c667a62653e187f29b5781eeb0703f26e99558080de0c0f9490b5f9c4ac2871', is_verified=True, brand=u'Discover', name=None)
% endif