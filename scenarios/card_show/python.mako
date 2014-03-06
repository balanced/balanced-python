% if mode == 'definition':
balanced.Card.fetch()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card.fetch('/cards/CC4cbNzUmFqGrc1GmFpXp6fe')
% endif