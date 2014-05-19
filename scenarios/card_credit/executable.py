import balanced

balanced.configure('ak-test-2jJSjIixy2qkOMmIONPtXnawOUftBDRSK')

card = balanced.Card.fetch('/cards/CC7nMc4BAti7DgvWmpGV5e6N')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)