% if mode == 'definition':

balanced.Credit.find()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


credit = balanced.Credit.find('/v1/credits/CR2M7u0Orut0VyFgtba8GAMf')

% endif