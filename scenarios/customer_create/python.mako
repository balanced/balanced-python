% if mode == 'definition':

balanced.Customer(...).save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


customer = balanced.Customer().save()

% endif