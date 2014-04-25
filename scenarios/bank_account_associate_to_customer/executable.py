import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/bank_accounts/BA3Y63fK5STwlhKNMkE3Utmd')
card.associate_to_customer('/customers/CU3VYCUIfwngJsidJWdGw2W5')