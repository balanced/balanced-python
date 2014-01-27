% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card_hold = balanced.CardHold.fetch('/card_holds/HL3iJ3toXGtGHwOyVMD9aT71')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% endif