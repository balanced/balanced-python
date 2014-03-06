import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

credit = balanced.Credit.fetch('/credits/CR5j27kuJPX6voI8aokUWsEG')
reversal = credit.reverse(
    amount=3000,
    description="Reversal for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)