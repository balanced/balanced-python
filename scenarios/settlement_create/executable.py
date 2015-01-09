import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

payable_account = balanced.Account.fetch('/accounts/AT3ogJE07IErLJYR510QO6sM')
payable_account.settle(
  appears_on_statement_as='ThingsCo',
  funding_instrument='/bank_accounts/BA45anEaEr8g0lOhzhcE9VAN',
  description='Payout A',
  meta={
    'group': 'alpha'
  }
)
)