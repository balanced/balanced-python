import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card_hold = balanced.CardHold.fetch('/card_holds/HL4a1BKhDiVV9Ueh9MTozVDs')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)