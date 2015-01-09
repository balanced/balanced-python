% if mode == 'definition':
balanced.Dispute.query
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

disputes = balanced.Dispute.query
% elif mode == 'response':

% endif