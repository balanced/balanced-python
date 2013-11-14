% if mode == 'definition':
balanced.Credit.find()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

credit = balanced.Credit.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/credits/CR1xunmvDnFBo3fynM1KnuUm')
% endif