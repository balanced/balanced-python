% if mode == 'definition':
balanced.Order().credit_to()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

order = balanced.Order.fetch('/orders/OR483MoeOnJEXwkxqoPdnDF3')
bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4UZsYXpf2BX97v5WPaT57O/credits')
order.credit_to(
    amount=5000,
    destination=bank_account
)
% elif mode == 'response':

% endif