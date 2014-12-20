import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

card_hold = balanced.CardHold.fetch('/card_holds/HL44qbPoom3uVlTlEGBZV7z2')
card_hold.cancel()