import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

refund = balanced.Refund.find('/v1/customers/CUuDKfPHvZhTmaNbEsg1BOO/refunds/RFHBiohkzkfO6RPYOrjc9US')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()