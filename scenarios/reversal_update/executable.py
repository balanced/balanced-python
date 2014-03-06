import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

reversal = balanced.Reversal.fetch('/reversals/RV5h1LgxTlH1OtHAZEfQbvbH')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()