import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

payable_account = balanced.Account.fetch('/accounts/AT3ogJE07IErLJYR510QO6sM')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR3vURGwVtqDnnkRS9fgH41G',
  meta={
    'rating': '8'
  }
)