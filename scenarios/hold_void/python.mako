% if mode == 'definition':
balanced.Hold.void()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/holds/HLz4ihqQhojMB0z17ZPxDXI')
hold.void()
% endif