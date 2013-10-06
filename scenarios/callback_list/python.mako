% if mode == 'definition':
balanced.Callback.query.all
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

callback = balanced.Callback.query.all()
% endif