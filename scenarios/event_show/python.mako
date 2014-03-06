% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

event = balanced.Event.fetch('/events/EVa26caeeea56411e3838802219cc35fd9')
% endif