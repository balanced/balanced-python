import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

payable_account = balanced.Account.fetch('/accounts/AT43cMKrvwKEJnV5qX8wCqY0')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA4UZsYXpf2BX97v5WPaT57O',
  description='Payout A'meta[group]='alpha',
)