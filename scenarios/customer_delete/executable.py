import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

customer = balanced.Customer.fetch('/customers/CUxN95d3eKLokMS6CymVtIB')
customer.unstore()