import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card_hold = balanced.CardHold.fetch('/card_holds/HL4joUazeM3BJE6emmv2Q8EF')
card_hold.cancel()