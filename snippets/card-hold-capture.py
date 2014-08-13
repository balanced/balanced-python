# card_hold_href is the stored href for the CardHold
card_hold = balanced.CardHold.fetch(card_hold_href)
debit = card_hold.capture(
    appears_on_statement_as='ShowsUpOnStmt',
    description='Some descriptive text for the debit in the dashboard'
)