% if mode == 'definition':

balanced.Refund.find
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


refund = balanced.Refund.find("/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/refunds/RF3n0NOGtl7IeHTwp1c5Bvfw")

% endif