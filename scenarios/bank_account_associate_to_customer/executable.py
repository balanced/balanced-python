import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card = balanced.Card.fetch('/bank_accounts/BA7zu6QXmylsn0o6qVpS8UO9')
card.associate_to_customer('/customers/CU7yCmXG2RxyyIkcHG3SIMUF')