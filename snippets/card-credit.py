# card_href is the stored href for the Card
card = balanced.Card.fetch(card_href)
card.credit(
    appears_on_statement_as='Some text',
    amount=5000,
    description='Some descriptive text for the debit in the dashboard'
)