% if mode == 'definition':

balanced.Customer(...).save()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


customer = balanced.Customer().save()

% endif