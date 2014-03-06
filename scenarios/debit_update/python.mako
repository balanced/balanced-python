% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = balanced.Debit.fetch('/debits/WD5PTwr2bwJLIyJio1pEpYBr')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% endif