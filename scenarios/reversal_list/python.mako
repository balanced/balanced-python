% if mode == 'definition':
balanced.Reversal.query()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

reversals = balanced.Reversal.query
% elif mode == 'response':
{
    "links": {
        "reversals.credit": "/credits/{reversals.credit}", 
        "reversals.events": "/reversals/{reversals.id}/events", 
        "reversals.order": "/orders/{reversals.order}"
    }, 
    "meta": {
        "first": "/reversals?limit=10&offset=0", 
        "href": "/reversals?limit=10&offset=0", 
        "last": "/reversals?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 1
    }, 
    "reversals": [
        {
            "amount": 3000, 
            "created_at": "2014-01-27T22:58:21.214829Z", 
            "currency": "USD", 
            "description": "Reversal for Order #1111", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/reversals/RV42n8M9XZWna427oPDDi4RG", 
            "id": "RV42n8M9XZWna427oPDDi4RG", 
            "links": {
                "credit": "CR40neytmVG2HDBp1opfF7sY", 
                "order": null
            }, 
            "meta": {
                "fulfillment.item.condition": "OK", 
                "merchant.feedback": "positive", 
                "user.refund_reason": "not happy with product"
            }, 
            "status": "succeeded", 
            "transaction_number": "RV219-169-0008", 
            "updated_at": "2014-01-27T22:58:22.190749Z"
        }
    ]
}
% endif