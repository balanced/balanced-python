% if mode == 'definition':
balanced.Callback
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

callback = balanced.Callback(
  url='http://www.example.com/callback'
).save()
% endif