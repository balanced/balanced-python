% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

debit = balanced.Debit.fetch('/debits/WD4scrlw85LkeIEQqOx3AgUW')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% endif