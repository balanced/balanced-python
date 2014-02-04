% if mode == 'definition':
balanced.Refund.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refunds = balanced.Refund.query
% elif mode == 'response':
{
    "links": {
        "refunds.debit": "/debits/{refunds.debit}", 
        "refunds.dispute": "/disputes/{refunds.dispute}", 
        "refunds.events": "/refunds/{refunds.id}/events", 
        "refunds.order": "/orders/{refunds.order}"
    }, 
    "meta": {
        "first": "/refunds?limit=10&offset=0", 
        "href": "/refunds?limit=10&offset=0", 
        "last": "/refunds?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 1
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