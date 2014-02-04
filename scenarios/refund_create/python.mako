% if mode == 'definition':
balanced.Debit().refund()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

debit = balanced.Debit.fetch('/debits/WD3MKNxNTKBGgA7mX50yogiu')
refund = debit.refund(
    amount=3000,
    description="Refund for Order #1111",
    meta={
        "merchant.feedback": "positive",
        "user.refund_reason": "not happy with product",
        "fulfillment.item.condition": "OK",
    }
)
% elif mode == 'response':
{
    "links": {
        "refunds.debit": "/debits/{refunds.debit}", 
        "refunds.dispute": "/disputes/{refunds.dispute}", 
        "refunds.events": "/refunds/{refunds.id}/events", 
        "refunds.order": "/orders/{refunds.order}"
    }, 
    "refunds": [
        {
            "amount": 3000, 
            "created_at": "2014-01-27T22:58:11.375665Z", 
            "currency": "USD", 
            "description": "Refund for Order #1111", 
            "href": "/refunds/RF3RklPuFgsgI50UuYtr4g6I", 
            "id": "RF3RklPuFgsgI50UuYtr4g6I", 
            "links": {
                "debit": "WD3MKNxNTKBGgA7mX50yogiu", 
                "dispute": null, 
                "order": null
            }, 
            "meta": {
                "fulfillment.item.condition": "OK", 
                "merchant.feedback": "positive", 
                "user.refund_reason": "not happy with product"
            }, 
            "status": "succeeded", 
            "transaction_number": "RF383-088-7077", 
            "updated_at": "2014-01-27T22:58:12.115131Z"
        }
    ]
}
% endif