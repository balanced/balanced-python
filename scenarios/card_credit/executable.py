import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC3iCCIHprJu5HPyP7vmE92B')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)