% if mode == 'definition':
balanced.CardHold.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card_holds = balanced.CardHold.query
% endif