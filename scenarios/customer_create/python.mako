% if mode == 'definition':
balanced.Customer(...).save()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

customer = balanced.Customer().save()
% endif