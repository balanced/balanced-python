% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

event = balanced.Event.fetch('/events/EV64ecf7cc852011e3a0ed026ba7c1aba6')
% endif