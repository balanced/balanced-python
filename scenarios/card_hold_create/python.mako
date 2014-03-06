% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC5nCSU0yFp3qxR4p6UZST7y')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif