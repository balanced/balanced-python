import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

payable_account = balanced.Account.fetch('/accounts/AT2E6Ju62P9AnTJwe0fL5kOI')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA3uzbngfVXy1SGg25Et7iKY',
  description='Payout A'meta[group]='alpha',
)