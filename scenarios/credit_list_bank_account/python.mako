% if mode == 'definition':
balanced.BankAccount().credits
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA8MzVwjVFnkuUvfHaXmqMZ/credits')
credits = bank_account.credits
% elif mode == 'response':

% endif