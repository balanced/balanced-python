import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

payable_account = balanced.Account.fetch('/accounts/AT43cMKrvwKEJnV5qX8wCqY0')
payable_account.credit(
  appears_on_statement_as='ThingsCo',
  amount=1000,
  description='A simple credit',
  order='/orders/OR483MoeOnJEXwkxqoPdnDF3'meta[rating]=8,
)