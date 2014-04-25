% if mode == 'definition':
balanced.BankAccount().credits
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3PDwDCkdeC4OgPtPNwoCWl/credits')
credits = bank_account.credits
% elif mode == 'response':

% endif