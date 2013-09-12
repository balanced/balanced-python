<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

debit = balanced.Debit.find('${request['debit_uri']}')
debit.refund(
    description='${request['payload']['description']}',
    meta={
        'fulfillment.item.condition': 'OK',
        'user.refund_reason': 'not happy with product',
        'merchant.feedback': 'positive',
    },
)