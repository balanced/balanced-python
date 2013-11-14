% if mode == 'definition':
balanced.Hold.query()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

holds = balanced.Hold.query.all();
% endif