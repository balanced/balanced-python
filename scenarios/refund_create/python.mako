% if mode == 'definition':
balanced.Debit.refund()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

debit = balanced.Debit.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/debits/WD3dI1cfIvXo7p2f9tNMNSc2')
debit.refund(
    description='Refund for Order #1111',
    meta={
        'fulfillment.item.condition': 'OK',
        'user.refund_reason': 'not happy with product',
        'merchant.feedback': 'positive',
    },
)
% endif