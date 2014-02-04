% if mode == 'definition':
balanced.Event.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

events = balanced.Event.query
% elif mode == 'response':
{
    "events": [
        {
            "callback_statuses": {
                "failed": 0, 
                "pending": 0, 
                "retrying": 0, 
                "succeeded": 0
            }, 
            "entity": {
                "customers": [
                    {
                        "address": {
                            "city": null, 
                            "country_code": null, 
                            "line1": null, 
                            "line2": null, 
                            "postal_code": null, 
                            "state": null
                        }, 
                        "business_name": null, 
                        "created_at": "2014-01-27T22:55:50.253066Z", 
                        "dob_month": null, 
                        "dob_year": null, 
                        "ein": null, 
                        "email": null, 
                        "href": "/customers/CU1iDnBalzHoZg47Np92rNrV", 
                        "id": "CU1iDnBalzHoZg47Np92rNrV", 
                        "links": {
                            "destination": null, 
                            "source": null
                        }, 
                        "merchant_status": "no-match", 
                        "meta": {}, 
                        "name": null, 
                        "phone": null, 
                        "ssn_last4": null, 
                        "updated_at": "2014-01-27T22:55:50.767858Z"
                    }
                ], 
                "links": {
                    "customers.bank_accounts": "/customers/{customers.id}/bank_accounts", 
                    "customers.card_holds": "/customers/{customers.id}/card_holds", 
                    "customers.cards": "/customers/{customers.id}/cards", 
                    "customers.credits": "/customers/{customers.id}/credits", 
                    "customers.debits": "/customers/{customers.id}/debits", 
                    "customers.destination": "/resources/{customers.destination}", 
                    "customers.orders": "/customers/{customers.id}/orders", 
                    "customers.refunds": "/customers/{customers.id}/refunds", 
                    "customers.reversals": "/customers/{customers.id}/reversals", 
                    "customers.source": "/resources/{customers.source}", 
                    "customers.transactions": "/customers/{customers.id}/transactions"
                }
            }, 
            "href": "/events/EV2abbb98487a611e3a86f026ba7d31e6f", 
            "id": "EV2abbb98487a611e3a86f026ba7d31e6f", 
            "links": {}, 
            "occurred_at": "2014-01-27T22:55:50.767000Z", 
            "type": "account.created"
        }
    ], 
    "links": {
        "events.callbacks": "/events/{events.self}/callbacks"
    }, 
    "meta": {
        "first": "/events?limit=10&offset=0", 
        "href": "/events?limit=10&offset=0", 
        "last": "/events?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 1
    }
}
% endif