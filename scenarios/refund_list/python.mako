% if mode == 'definition':
balanced.Refund.query()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

refunds = balanced.Refund.query.all();
% endif