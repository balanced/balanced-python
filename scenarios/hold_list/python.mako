% if mode == 'definition':
balanced.Hold.query()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

holds = balanced.Hold.query.all();
% endif