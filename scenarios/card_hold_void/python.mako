% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5Ig892KbmJyDqED5fYsJ8m')
card_hold.cancel()
% endif