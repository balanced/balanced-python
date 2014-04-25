import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

merchant_customer = balanced.Customer.fetch('/customers/CU4MnFEab304anOtUtEu5hkN')
merchant_customer.create_order(
  description='Order #12341234'
).save()