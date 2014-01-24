% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card_hold = balanced.CardHold.fetch('/card_holds/HL3qaOBRFhWgKwSPz7bCetSn')
card_hold.cancel()
% endif