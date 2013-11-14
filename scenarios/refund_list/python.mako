% if mode == 'definition':
balanced.Refund.query()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

refunds = balanced.Refund.query.all();
% endif