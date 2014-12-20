import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

debit = balanced.Debit.fetch('/debits/WD4LT3ghEgoGK9z4wUQCsKUU')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)