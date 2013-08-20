import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")

customer = balanced.Customer.find('/v1/customers/CU6PXyMacKRYKNJPJFKtONK0')
customer.unstore()
