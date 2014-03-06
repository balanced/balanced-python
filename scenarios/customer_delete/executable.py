import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

customer = balanced.Customer.fetch('/customers/CU4EeI9UPzRcOo2C3j1qFjQj')
customer.unstore()