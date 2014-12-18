import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

merchant_customer = balanced.Customer.fetch('/customers/CU6sIkS1KUtHVoPUBM1Gf72B')
merchant_customer.create_order(
  description='Order #12341234'
).save()