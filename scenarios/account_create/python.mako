% if mode == 'definition':

balanced.Account(...).save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


account = balanced.Account().save()

% endif