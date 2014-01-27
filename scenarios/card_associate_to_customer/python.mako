% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC3kqm84fxh50avenrUsSKbu')
card.associate_to_customer('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
% endif