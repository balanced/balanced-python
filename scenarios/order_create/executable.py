import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

merchant_customer = balanced.Customer.fetch('/customers/CUxN95d3eKLokMS6CymVtIB')
merchant_customer.create_order(
  description='Order #12341234'
).save()