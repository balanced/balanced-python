% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC3kqm84fxh50avenrUsSKbu')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
{
    "debits": [
        {
            "amount": 5000, 
            "appears_on_statement_as": "BAL*Statement text", 
            "created_at": "2014-01-27T22:58:07.291226Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/debits/WD3MKNxNTKBGgA7mX50yogiu", 
            "id": "WD3MKNxNTKBGgA7mX50yogiu", 
            "links": {
                "customer": "CU3eeasZ9yQ86uzzIYZkrPGg", 
                "dispute": null, 
                "order": null, 
                "source": "CC3kqm84fxh50avenrUsSKbu"
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "W180-465-2000", 
            "updated_at": "2014-01-27T22:58:09.706862Z"
        }
    ], 
    "links": {
        "debits.customer": "/customers/{debits.customer}", 
        "debits.dispute": "/disputes/{debits.dispute}", 
        "debits.events": "/debits/{debits.id}/events", 
        "debits.order": "/orders/{debits.order}", 
        "debits.refunds": "/debits/{debits.id}/refunds", 
        "debits.source": "/resources/{debits.source}"
    }
}
% endif