% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callback = balanced.Callback.fetch('/callbacks/CB224374R2NSyoYBpDV4r7C2')
callback.unstore()
% elif mode == 'response':

% endif