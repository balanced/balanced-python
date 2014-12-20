import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

payable_account = balanced.Account.fetch('/accounts/AT2E6Ju62P9AnTJwe0fL5kOI')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR2JfBYxYlDAF3L48u9DtIEU'meta[rating]=8,
)