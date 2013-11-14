% if mode == 'definition':
balanced.Callback.query.all
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

callback = balanced.Callback.query.all()
% endif