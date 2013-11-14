% if mode == 'definition':
balanced.Account.add_card
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

account = balanced.Account.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/accounts/CUhWPVv3F9tVZoGd1GPo2zQ')
account.add_card('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CCjOJKFuXZJlQm9oKtqVZwW')
% endif