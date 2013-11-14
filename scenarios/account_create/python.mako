% if mode == 'definition':
balanced.Account(...).save()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

account = balanced.Account().save()
% endif