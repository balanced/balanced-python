import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4CIbHV4zlSfx5c6eKK1AOY')
card_hold.cancel()