% if mode == 'definition':
balanced.Debit.save()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

debit = balanced.Debit.find('/debits/WD6TAVProqNixngz5tRCO52C')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% endif