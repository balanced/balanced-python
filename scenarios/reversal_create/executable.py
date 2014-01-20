import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

credit = balanced.Credit.find('/credits/CR4lqO3NwBWdLYGvMAUeKt7g')
reversal = credit.reverse(
    amount = 3000,
    description = "Reversal for Order #1111",
    meta = {
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)