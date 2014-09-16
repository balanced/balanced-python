import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

merchant_customer = balanced.Customer.fetch('/customers/CU64t3pxAegzhZL0O8WMpWi9')
merchant_customer.create_order(
  description='Order #12341234'
).save()