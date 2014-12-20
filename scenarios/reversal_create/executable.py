import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

credit = balanced.Credit.fetch('/credits/CR5pb9ux8RYVNTwcJ3jdVF84')
reversal = credit.reverse(
    amount=3000,
    description="Reversal for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)