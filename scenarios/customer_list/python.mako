% if mode == 'definition':
balanced.Customer.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customers = balanced.Customer.query
% elif mode == 'response':
{
    "customers": [
        {
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": "48120", 
                "state": null
            }, 
            "business_name": null, 
            "created_at": "2014-01-27T22:57:27.459187Z", 
            "dob_month": 7, 
            "dob_year": 1963, 
            "ein": null, 
            "email": null, 
            "href": "/customers/CU33Y4cut21qu1d1lGYDBseQ", 
            "id": "CU33Y4cut21qu1d1lGYDBseQ", 
            "links": {
                "destination": null, 
                "source": null
            }, 
            "merchant_status": "underwritten", 
            "meta": {}, 
            "name": "Henry Ford", 
            "phone": null, 
            "ssn_last4": null, 
            "updated_at": "2014-01-27T22:57:29.488272Z"
        }, 
        {
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": "48120", 
                "state": null
            }, 
            "business_name": null, 
            "created_at": "2014-01-27T22:57:12.447565Z", 
            "dob_month": 7, 
            "dob_year": 1963, 
            "ein": null, 
            "email": null, 
            "href": "/customers/CU2N5goX8AQJE0CCPeapHUsM", 
            "id": "CU2N5goX8AQJE0CCPeapHUsM", 
            "links": {
                "destination": null, 
                "source": null
            }, 
            "merchant_status": "underwritten", 
            "meta": {}, 
            "name": "Henry Ford", 
            "phone": null, 
            "ssn_last4": null, 
            "updated_at": "2014-01-27T22:57:13.581358Z"
        }, 
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
        }, 
        {
            "address": {
                "city": "Nowhere", 
                "country_code": "USA", 
                "line1": null, 
                "line2": null, 
                "postal_code": "90210", 
                "state": null
            }, 
            "business_name": null, 
            "created_at": "2014-01-27T22:55:47.156306Z", 
            "dob_month": 2, 
            "dob_year": 1947, 
            "ein": null, 
            "email": "whc@example.org", 
            "href": "/customers/CU1f8Ygc4t0F2FKNcw235x9I", 
            "id": "CU1f8Ygc4t0F2FKNcw235x9I", 
            "links": {
                "destination": null, 
                "source": null
            }, 
            "merchant_status": "underwritten", 
            "meta": {}, 
            "name": "William Henry Cavendish III", 
            "phone": "+16505551212", 
            "ssn_last4": "xxxx", 
            "updated_at": "2014-01-27T22:55:47.781694Z"
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
    }, 
    "meta": {
        "first": "/customers?limit=10&offset=0", 
        "href": "/customers?limit=10&offset=0", 
        "last": "/customers?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 4
    }
}
% endif