# credit_href is the stored href for the Credit
credit = balanced.Credit.fetch(credit_href)
reversal = credit.reverse(
    amount=100000,
    description="Reversal for order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK"
    }
)