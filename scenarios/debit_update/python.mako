% if mode == 'definition':
balanced.Debit.save()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/debits/WD6SNqybglelPXcBZVcH40gG')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% endif