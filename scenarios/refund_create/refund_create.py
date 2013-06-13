import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/debits/WD3lDAXDcPpgK8tHFcdXEO2Y')
debit.refund(
    description='Refund for Order #1111',
    meta={
        'fulfillment.item.condition': 'OK',
        'user.refund_reason': 'not happy with product',
        'merchant.feedback': 'positive',
    },
)