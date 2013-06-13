import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/debits/WD2WxgyBFgXDKw942umEDHa8')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()