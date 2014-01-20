% if mode == 'definition':
balanced.Hold(...)
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

hold = balanced.Hold(
  source_uri='/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CC3AiMy0KEP1PhwnffMk32RF',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
hold.save()
% endif