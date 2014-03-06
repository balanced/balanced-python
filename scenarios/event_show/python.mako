% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

event = balanced.Event.fetch('/events/EV7838c0f6a4bd11e3937f060e77eca47a')
% endif