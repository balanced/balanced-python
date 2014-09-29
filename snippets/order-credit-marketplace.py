marketplace_bank_account = balanced.Marketplace.mine.owner_customer.bank_accounts[0]
order.credit_to(
    amount=2000,
    description="Credit from order escrow to marketplace bank account",
    destination=marketplace_bank_account
)