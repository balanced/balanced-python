% if mode == 'definition':

balanced.Credit.query
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


credits = balanced.Credit.query.all()

% endif