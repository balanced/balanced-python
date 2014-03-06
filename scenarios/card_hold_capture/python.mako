% if mode == 'definition':
balanced.CardHold().capture()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5wAfv8JaMsEn9idXrLZZZT')
debit = card_hold.capture(
  appears_on_statement_as='ShowsUpOnStmt',
  description='Some descriptive text for the debit in the dashboard'
)
% endif