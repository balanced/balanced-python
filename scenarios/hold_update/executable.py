import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/holds/HLgZ3lv8DVAtfnxDJmieJ5S')
hold.description = 'update this description'
hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
hold.save()