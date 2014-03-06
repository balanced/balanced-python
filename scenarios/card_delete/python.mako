% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/cards/CC5Buki6e4Kg4bDVZ3OSfQ8O')
card.unstore()
% endif