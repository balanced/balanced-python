% if mode == 'definition':
balanced.Debit.refund()
% else:
import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

debit = balanced.Debit.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/debits/WDE7lu1wLfsf2JhWHYM6U2W')
debit.refund(
    description='Refund for Order #1111',
    meta={
        'fulfillment.item.condition': 'OK',
        'user.refund_reason': 'not happy with product',
        'merchant.feedback': 'positive',
    },
)
% endif