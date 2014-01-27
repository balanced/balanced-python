import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0')
card.associate_to_customer('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')