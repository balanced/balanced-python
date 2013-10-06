% if mode == 'definition':
balanced.Event.query
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

events = balanced.Event.query.all();
% endif