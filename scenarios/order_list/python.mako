% if mode == 'definition':
balanced.Order.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

orders = balanced.Order.query
% elif mode == 'response':
{
    "links": {
        "orders.buyers": "/orders/{orders.id}/buyers", 
        "orders.credits": "/orders/{orders.id}/credits", 
        "orders.debits": "/orders/{orders.id}/debits", 
        "orders.merchant": "/customers/{orders.merchant}", 
        "orders.refunds": "/orders/{orders.id}/refunds", 
        "orders.reversals": "/orders/{orders.id}/reversals"
    }, 
    "meta": {
        "first": "/orders?limit=10&offset=0", 
        "href": "/orders?limit=10&offset=0", 
        "last": "/orders?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 1
    }, 
    "orders": [
        {
            "amount": 0, 
            "amount_escrowed": 0, 
            "created_at": "2014-01-27T22:58:01.115720Z", 
            "currency": "USD", 
            "delivery_address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": null, 
                "state": null
            }, 
            "description": "Order #12341234", 
            "href": "/orders/OR3FOihZa7lMHdAP5p8BJZVY", 
            "id": "OR3FOihZa7lMHdAP5p8BJZVY", 
            "links": {
                "merchant": "CU3eeasZ9yQ86uzzIYZkrPGg"
            }, 
            "meta": {}, 
            "updated_at": "2014-01-27T22:58:01.115723Z"
        }
    ]
}
% endif