% if mode == 'definition':
balanced.Order()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

merchant_customer = balanced.Customer.fetch('/customers/CU64R7DS6DwuXYVg9RTskFK8')
merchant_customer.create_order(
  description='Order #12341234'
).save()
% endif