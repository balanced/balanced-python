% if mode == 'definition':
balanced.Card.query()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

cards = balanced.Card.query.all();
% endif