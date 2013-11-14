% if mode == 'definition':
balanced.Callback
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

callback = balanced.Callback(
  url='http://www.example.com/callback'
).save()
% endif