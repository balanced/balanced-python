import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

order = balanced.Order.find('/orders/OR7tbUrFlrIwYwE4iCuhtq0v')
order.description = 'New description for order'
order.meta = {
  'anykey' => 'valuegoeshere',
  'product.id' => '1234567890'
}
order.save()