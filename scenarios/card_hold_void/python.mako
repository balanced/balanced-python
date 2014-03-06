% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card_hold = balanced.CardHold.fetch('/card_holds/HL4fmk2370zAE7nAVujKxjtf')
card_hold.cancel()
% endif