% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = balanced.Credit.fetch('/credits/CR2UtQgq6L3FPd1YoOc8eyOC')
% elif mode == 'response':
{
    "credits": [
        {
            "amount": 5000, 
            "appears_on_statement_as": "example.com", 
            "created_at": "2014-01-27T22:57:19.073817Z", 
            "currency": "USD", 
            "description": null, 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/credits/CR2UtQgq6L3FPd1YoOc8eyOC", 
            "id": "CR2UtQgq6L3FPd1YoOc8eyOC", 
            "links": {
                "customer": "CU2N5goX8AQJE0CCPeapHUsM", 
                "destination": "BA2QAksIxlLt60lqKc1wwgJy", 
                "order": null
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "CR408-633-3169", 
            "updated_at": "2014-01-27T22:57:20.208794Z"
        }
    ], 
    "links": {
        "credits.customer": "/customers/{credits.customer}", 
        "credits.destination": "/resources/{credits.destination}", 
        "credits.events": "/credits/{credits.id}/events", 
        "credits.order": "/orders/{credits.order}", 
        "credits.reversals": "/credits/{credits.id}/reversals"
    }
}
% endif