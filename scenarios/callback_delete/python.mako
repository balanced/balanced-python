% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

callback = balanced.Callback.fetch('/callbacks/CB44XaMOcxsUnuQoA5A4VKCx')
callback.unstore()
% elif mode == 'response':

% endif