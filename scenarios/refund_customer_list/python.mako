% if mode == 'definition':
balanced.Customer.refunds
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC7uApw73nVe459gEQ4ynVJu')
refunds = customer.refunds.all()
% endif