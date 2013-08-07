% if mode == 'definition':

balanced.Hold.void()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/holds/HL5DjCcU0FHDkiNj6X2ITrhm')
hold.void()

% endif