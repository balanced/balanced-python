import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

merchant_customer = balanced.Customer.fetch('/customers/CU4EeI9UPzRcOo2C3j1qFjQj')
merchant_customer.create_order(
  description='Order #12341234'
).save()