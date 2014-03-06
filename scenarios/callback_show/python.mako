% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callback = balanced.Callback.fetch('/callbacks/CB5pnz4XnaDpRFGlNMb6u50R')
% endif