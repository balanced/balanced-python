import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR5e6wrps4tp9QarDxWa01O5')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()