% if mode == 'definition':
balanced.Callback().unstore()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

callback = balanced.Callback.find('/callbacks/CB37kedWD88LFkipaugpfZ9w')
callback.unstore()
% endif