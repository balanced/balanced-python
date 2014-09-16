import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

customer = balanced.Customer.fetch('/customers/CU64t3pxAegzhZL0O8WMpWi9')
customer.unstore()