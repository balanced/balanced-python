% if mode == 'definition':
balanced.Hold(...)
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

hold = balanced.Hold(
  source_uri='/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/cards/CC15RAm6JJIEIae6bicvlWRw'
  amount=5000
  description='Some descriptive text for the debit in the dashboard'
)
% endif