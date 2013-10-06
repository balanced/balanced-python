import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/holds/HL1a9V1z4YLJd0vTGWOvXxs2')
debit = hold.capture(
  appears_on_statement_as='ShowsUpOnStmt'
  hold_uri='/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/holds/HL1a9V1z4YLJd0vTGWOvXxs2'
  description='Some descriptive text for the debit in the dashboard'
)