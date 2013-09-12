% if mode == 'definition':
balanced.Credit.query
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


credits = balanced.Credit.query.all()
% endif