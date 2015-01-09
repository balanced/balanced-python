% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card = balanced.Card(
  expiration_month='05',
  name='Johannes Bach',
  expiration_year='2020',
  number='4342561111111118'
).save()
% elif mode == 'response':
Card(links={u'customer': None}, cvv_result=None, number=u'xxxxxxxxxxxx1118', expiration_month=5, href=u'/cards/CC4HDcgvzIltvwv6GSjBVbji', type=u'debit', id=u'CC4HDcgvzIltvwv6GSjBVbji', category=u'other', is_verified=True, cvv_match=None, bank_name=u'WELLS FARGO BANK, N.A.', avs_street_match=None, brand=u'Visa', updated_at=u'2015-01-09T03:23:58.549645Z', fingerprint=u'7dc93d35b59078a1da8e0ebd2cbec65a6ca205760a1be1b90a143d7f2b00e355', can_debit=True, name=u'Johannes Bach', expiration_year=2020, cvv=None, avs_postal_match=None, avs_result=None, can_credit=True, meta={}, created_at=u'2015-01-09T03:23:58.549644Z', address={u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None})
% endif