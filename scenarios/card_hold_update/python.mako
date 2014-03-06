% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card_hold = balanced.CardHold.fetch('/card_holds/HL5wAfv8JaMsEn9idXrLZZZT')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% endif