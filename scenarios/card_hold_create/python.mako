% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card.fetch('/cards/CC3ZsWHP2jMgvFrrzDzfZS0q')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% endif