import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

customer = balanced.Customer.fetch('/customers/CU5AxbQrjAcjsbquafnvwaas')
customer.unstore()