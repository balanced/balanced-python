import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

card = balanced.Card.fetch('/cards/CC4tvKLTKXcBJAgkGvPEW58N')
card.associate_to_customer('/customers/CU3VYCUIfwngJsidJWdGw2W5')