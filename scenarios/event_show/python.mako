% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

event = balanced.Event.find('/events/EV610bd3fe788111e3b3e8026ba7cd33d0')
% endif