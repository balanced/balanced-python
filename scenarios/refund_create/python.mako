% if mode == 'definition':

balanced.Debit.refund()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


debit = balanced.Debit.find('/v1/marketplaces/TEST-MP40BcQ7XUk3TlZOupT5Y3Nm/debits/WD5Gv7XetHvx1CHUqkDKiZYY')
debit.refund(
    description='Refund for Order #1111',
    meta={
        'fulfillment.item.condition': 'OK',
        'user.refund_reason': 'not happy with product',
        'merchant.feedback': 'positive',
    },
)

% endif