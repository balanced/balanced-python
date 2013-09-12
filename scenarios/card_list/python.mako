% if mode == 'definition':
balanced.Card.query()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


cards = balanced.Card.query.all();
% endif