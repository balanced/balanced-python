import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

merchant_customer = balanced.Customer.fetch('/customers/CU4CZc7Xjn8gGJXl1LyzZk7S')
merchant_customer.create_order(
  description='Order #12341234'
).save()