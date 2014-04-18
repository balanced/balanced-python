import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

customer = balanced.Customer.fetch('/customers/CU1eX3FIMntmCLmi2VfWA2db')
customer.unstore()