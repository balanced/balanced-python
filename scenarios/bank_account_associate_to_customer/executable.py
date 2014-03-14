import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = balanced.Card.fetch('/bank_accounts/BA6bLGpQZPOiTNRxF24rMd9m')
card.associate_to_customer('/customers/CU64R7DS6DwuXYVg9RTskFK8')