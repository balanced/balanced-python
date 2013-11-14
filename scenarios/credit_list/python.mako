% if mode == 'definition':
balanced.Credit.query
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

credits = balanced.Credit.query.all()
% endif