import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

merchant_customer = balanced.Customer.fetch('/customers/CU5AxbQrjAcjsbquafnvwaas')
merchant_customer.create_order(
  description='Order #12341234'
).save()