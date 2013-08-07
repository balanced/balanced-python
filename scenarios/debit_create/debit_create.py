import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


buyer = balanced.Account.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/accounts/AC4aHI8dZiHocr1M5FARdZzg')
buyer.debit(
    appears_on_statement_as='Statement text',
    amount='5000',
    description='Some descriptive text for the debit in the dashboard',
)