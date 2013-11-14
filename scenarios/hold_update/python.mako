% if mode == 'definition':
balanced.Hold.save()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/holds/HL2PtUrw5zStavbcn933ZsmW')
hold.description = 'update this description'
hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
hold.save()
% endif