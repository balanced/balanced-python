% if mode == 'definition':
balanced.Credit.query
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

credits = balanced.Credit.query.all()
% endif