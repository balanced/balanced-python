# debit_href is the stored href for the Debit
# order_href is the stored href for the Order
debit = balanced.Debit.fetch(debit_href)
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    },
    order=order_href
)