import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

reversal = balanced.Reversal.fetch('/reversals/RV6OCxJ1UhkG84is6H9PHjkZ')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()