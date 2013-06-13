import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/holds/HL3hEt8bLti69i3rvYVuQ2WC')
hold.void()