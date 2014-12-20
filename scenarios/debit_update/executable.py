import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

debit = balanced.Debit.fetch('/debits/WD4FfxxWRRcrlCsGEPti58RT')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()