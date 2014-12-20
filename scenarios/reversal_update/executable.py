import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

reversal = balanced.Reversal.fetch('/reversals/RV5q7RVGWz47dsBoZGU5OceI')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()