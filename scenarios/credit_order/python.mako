% if mode == 'definition':
balanced.Order().credit_to()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

order = balanced.Order.fetch('/orders/OR3vURGwVtqDnnkRS9fgH41G')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)
% elif mode == 'response':

% endif