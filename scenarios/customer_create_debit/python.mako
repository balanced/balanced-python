% if mode == 'definition':
balanced.Customer.debit()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC6M5tIyndBqrv4fEdubPUhg')
customer.debit(amount=5000)
% endif