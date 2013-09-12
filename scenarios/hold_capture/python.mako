% if mode == 'definition':
balanced.Hold.capture(...)
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/holds/HL9QEGalzLAwdu0tCi08qjA')
debit = hold.capture(
  appears_on_statement_as='ShowsUpOnStmt'
  hold_uri='/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/holds/HL9QEGalzLAwdu0tCi08qjA'
  description='Some descriptive text for the debit in the dashboard'
)
% endif