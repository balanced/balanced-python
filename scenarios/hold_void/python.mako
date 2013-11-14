% if mode == 'definition':
balanced.Hold.void()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/holds/HL39pZ8ec317eN4fi57TpmUU')
hold.void()
% endif