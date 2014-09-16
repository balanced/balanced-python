% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card(
  cvv='123',
  expiration_month='12',
  number='6500000000000002',
  expiration_year='3000'
).save()
% elif mode == 'response':
Card(links={u'customer': None}, cvv_result=u'Match', number=u'xxxxxxxxxxxx0002', expiration_month=12, href=u'/cards/CC6KXqaIUXHDh6BJpY2XqRTW', type=u'debit', id=u'CC6KXqaIUXHDh6BJpY2XqRTW', category=u'other', is_verified=True, cvv_match=u'yes', bank_name=u'BANK OF AMERICA', avs_street_match=None, brand=u'Discover', updated_at=u'2014-09-02T18:27:59.762352Z', fingerprint=u'3c667a62653e187f29b5781eeb0703f26e99558080de0c0f9490b5f9c4ac2871', can_debit=True, name=None, expiration_year=3000, cvv=u'xxx', avs_postal_match=None, avs_result=None, can_credit=True, meta={}, created_at=u'2014-09-02T18:27:59.762349Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None})
% endif