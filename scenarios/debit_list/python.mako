% if mode == 'definition':
balanced.Debit.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

debits = balanced.Debit.query
% elif mode == 'response':
{
    "debits": [
        {
            "amount": 5000, 
            "appears_on_statement_as": "BAL*Statement text", 
            "created_at": "2014-01-27T22:57:05.511023Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/debits/WD2Fd3jVcMZEWyXHtG3U1LRM", 
            "id": "WD2Fd3jVcMZEWyXHtG3U1LRM", 
            "links": {
                "customer": null, 
                "dispute": null, 
                "order": null, 
                "source": "CC2uc8iPDjgyxOXHVtnZloyI"
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "W906-153-1439", 
            "updated_at": "2014-01-27T22:57:10.153696Z"
        }, 
        {
            "amount": 5000, 
            "appears_on_statement_as": "BAL*ShowsUpOnStmt", 
            "created_at": "2014-01-27T22:56:45.623268Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/debits/WD2iSCukjXyeRdkvX3cW0PmC", 
            "id": "WD2iSCukjXyeRdkvX3cW0PmC", 
            "links": {
                "customer": "CU1f8Ygc4t0F2FKNcw235x9I", 
                "dispute": null, 
                "order": null, 
                "source": "CC2abDOQVm5aNFhHpcRvWS02"
            }, 
            "meta": {
                "holding.for": "user1", 
                "meaningful.key": "some.value"
            }, 
            "status": "succeeded", 
            "transaction_number": "W744-719-1832", 
            "updated_at": "2014-01-27T22:56:47.926021Z"
        }, 
        {
            "amount": 5000, 
            "appears_on_statement_as": "BAL*Statement text", 
            "created_at": "2014-01-27T22:56:28.702119Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/debits/WD1ZRRAZnFTryFdFaq7ijcPE", 
            "id": "WD1ZRRAZnFTryFdFaq7ijcPE", 
            "links": {
                "customer": null, 
                "dispute": null, 
                "order": null, 
                "source": "BA1D3vL3LjasB0kewMqRGI0S"
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "W081-463-7557", 
            "updated_at": "2014-01-27T22:56:29.235927Z"
        }, 
        {
            "amount": 10000000, 
            "appears_on_statement_as": "BAL*example.com", 
            "created_at": "2014-01-27T22:55:56.757487Z", 
            "currency": "USD", 
            "description": null, 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/debits/WD1pU48nHJzorOySkTaQGQ9U", 
            "id": "WD1pU48nHJzorOySkTaQGQ9U", 
            "links": {
                "customer": "CU1iDnBalzHoZg47Np92rNrV", 
                "dispute": null, 
                "order": null, 
                "source": "CC1nrXVKmfh0ouOS7zxI6X8q"
            }, 
            "meta": {}, 
            "status": "succeeded", 
            "transaction_number": "W511-688-4504", 
            "updated_at": "2014-01-27T22:56:00.833870Z"
        }
    ], 
    "links": {
        "debits.customer": "/customers/{debits.customer}", 
        "debits.dispute": "/disputes/{debits.dispute}", 
        "debits.events": "/debits/{debits.id}/events", 
        "debits.order": "/orders/{debits.order}", 
        "debits.refunds": "/debits/{debits.id}/refunds", 
        "debits.source": "/resources/{debits.source}"
    }, 
    "meta": {
        "first": "/debits?limit=10&offset=0", 
        "href": "/debits?limit=10&offset=0", 
        "last": "/debits?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 4
    }
}
% endif