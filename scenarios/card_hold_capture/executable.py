import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL3QlUen3sZjc3dPbgK40F7G')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)