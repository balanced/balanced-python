% if mode == 'definition':
balanced.Card.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

cards = balanced.Card.query
% endif