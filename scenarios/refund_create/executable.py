import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = balanced.Debit.fetch('/debits/WD6BKYhbRzlRhfKSE1DcpqS5')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)