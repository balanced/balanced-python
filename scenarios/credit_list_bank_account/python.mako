% if mode == 'definition':
balanced.BankAccount().credits
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA7sojXcP7oSdQyrjUA7wXg9/credits')
credits = bank_account.credits
% elif mode == 'response':

% endif