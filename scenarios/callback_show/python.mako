% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

callback = balanced.Callback.fetch('/callbacks/CB37kedWD88LFkipaugpfZ9w')
% endif