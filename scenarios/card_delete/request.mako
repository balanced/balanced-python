import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


card = balanced.Card.find("/v1/bank_accounts/BA2af6ai3i6WZZ0FMrI4OKhk")
card.delete()