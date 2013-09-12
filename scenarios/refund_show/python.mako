% if mode == 'definition':
balanced.Refund.find
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


refund = balanced.Refund.find('/v1/customers/AC7uApw73nVe459gEQ4ynVJu/refunds/RF7DgCMEweMG2iUl2MYw56cn')
% endif