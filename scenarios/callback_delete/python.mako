% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callback = balanced.Callback.fetch('/callbacks/CB5pnz4XnaDpRFGlNMb6u50R')
callback.unstore()
% elif mode == 'response':

% endif