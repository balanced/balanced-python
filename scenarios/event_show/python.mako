% if mode == 'definition':
balanced.Event.find
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

event = balanced.Event.find('/v1/events/EVba70d17a2ec511e38f60026ba7cac9da')
% endif