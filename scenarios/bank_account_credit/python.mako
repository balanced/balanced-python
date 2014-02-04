% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
{
    "credits": [
        {
            "amount": 5000, 
            "appears_on_statement_as": "example.com", 
            "created_at": "2014-01-27T22:58:19.422292Z", 
            "currency": "USD", 
            "description": null, 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/credits/CR40neytmVG2HDBp1opfF7sY", 
            "id": "CR40neytmVG2HDBp1opfF7sY", 
            "links": {
                "customer": "CU3eeasZ9yQ86uzzIYZkrPGg", 
                "destination": "BA3qNbYRqFM0Q7MXn3IcjGl0", 
                "order": null
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "CR816-868-3666", 
            "updated_at": "2014-01-27T22:58:20.346871Z"
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