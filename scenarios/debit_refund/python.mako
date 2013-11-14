% if mode == 'definition':
balanced.Debit.refund()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

debit = balanced.Debit.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/debits/WD2za3rLGBUpINViqUGbY5XW')
debit.refund()
% endif