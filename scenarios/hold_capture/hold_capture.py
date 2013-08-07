import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/holds/HL5zdhxmKBk5X1Nn0ZS21UYE')
debit = hold.capture(
    appears_on_statement_as='ShowsUpOnStmt',
    description='Some descriptive text for the debit in the dashboard',
)