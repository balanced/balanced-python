% if mode == 'definition':

balanced.Refund.save()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


refund = balanced.Refund.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/refunds/RF3n0NOGtl7IeHTwp1c5Bvfw')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()

% endif