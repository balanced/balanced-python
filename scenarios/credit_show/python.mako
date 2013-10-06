% if mode == 'definition':
balanced.Credit.find()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

credit = balanced.Credit.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/credits/CR6Y384863fzeb73YbW5NHVe')
% endif