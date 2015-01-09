% if mode == 'definition':
balanced.Account.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

customer = balanced.Customer.fetch('/customers/CU3o1ZAd8Gtxz6ZTIFK9YmsM')
customer.accounts
% elif mode == 'response':

% endif