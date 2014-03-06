% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC68IoCVpoFlkugB7xt52p8C')
card.associate_to_customer('/customers/CU64R7DS6DwuXYVg9RTskFK8')
% endif