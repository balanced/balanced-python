import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

customer = balanced.Customer.fetch('/customers/CU4MnFEab304anOtUtEu5hkN')
customer.unstore()