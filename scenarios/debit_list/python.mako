% if mode == 'definition':
balanced.Debit.query()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

debits = balanced.Debit.query.all();
% endif