import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

merchant_customer = balanced.Customer.fetch('/customers/CU1eX3FIMntmCLmi2VfWA2db')
merchant_customer.create_order(
  description='Order #12341234'
).save()