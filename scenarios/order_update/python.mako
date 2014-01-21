% if mode == 'definition':
balanced.Order().save()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

order = balanced.Order.find('/orders/OR47s8iZqDt662LdYa5My3oK')
order.description = 'New description for order'
order.meta = {
  'anykey': 'valuegoeshere',
  'product.id': '1234567890'
}
order.save()
% endif