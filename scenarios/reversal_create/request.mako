<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

credit = balanced.Credit.fetch('${request['credit_href']}')
reversal = credit.reverse(
    amount=3000,
    description="Reversal for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
