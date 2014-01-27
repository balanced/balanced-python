import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

merchant_customer = balanced.Customer.fetch('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
merchant_customer.create_order(
  description='Order #12341234'
).save()