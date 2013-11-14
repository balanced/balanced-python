import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

hold = balanced.Hold.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/holds/HL3CgDhSRS2YOwbR7Uj0eXtU')
debit = hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)