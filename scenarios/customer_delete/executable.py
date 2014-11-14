import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

customer = balanced.Customer.fetch('/customers/CU40AyvBB6ny9u3oelCwyc3C')
customer.unstore()