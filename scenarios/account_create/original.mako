% if mode == 'definition':

balanced.Account(...).save()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


account = balanced.Account().save()

% endif