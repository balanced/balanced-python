% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card_hold = balanced.CardHold.fetch('/card_holds/HL4a1BKhDiVV9Ueh9MTozVDs')
% endif