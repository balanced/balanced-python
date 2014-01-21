<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

debit = balanced.Debit.find('${request['debit_href']}')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
