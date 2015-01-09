% if mode == 'definition':
balanced.Debit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

debits = balanced.Debit.query
% elif mode == 'response':

% endif