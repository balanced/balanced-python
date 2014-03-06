% if mode == 'definition':
balanced.Credit().reverse()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

credit = balanced.Credit.fetch('/credits/CR6NpuEtezCdLTYngDrSEODv')
reversal = credit.reverse(
    amount=3000,
    description="Reversal for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
% endif