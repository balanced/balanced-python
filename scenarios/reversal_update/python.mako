% if mode == 'definition':
balanced.Reversal().save()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

reversal = balanced.Reversal.find('/reversals/RV4mvdReJFZTySZXe8IyQ8Bi')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% endif