import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

order = balanced.Order.fetch('/orders/OR6wcEVkOymvs4PairiGEcIx')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()