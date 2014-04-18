% if mode == 'definition':
balanced.Dispute.query
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

disputes = balanced.Dispute.query
% elif mode == 'response':

% endif