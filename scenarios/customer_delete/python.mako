% if mode == 'definition':
balanced.Customer(...).unstore()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC6JFZyy8FN8rHX1xsg2ucKA')
customer.unstore()
% endif