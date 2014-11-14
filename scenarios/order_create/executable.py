import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

merchant_customer = balanced.Customer.fetch('/customers/CU40AyvBB6ny9u3oelCwyc3C')
merchant_customer.create_order(
  description='Order #12341234'
).save()