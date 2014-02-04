% if mode == 'definition':
balanced.CardHold.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_holds = balanced.CardHold.query
% elif mode == 'response':
{
    "card_holds": [
        {
            "amount": 5000, 
            "created_at": "2014-01-27T22:56:39.379941Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "expires_at": "2014-02-03T22:56:39.876902Z", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S", 
            "id": "HL2bT9uMRkTZkfSPmA2pBD9S", 
            "links": {
                "card": "CC2abDOQVm5aNFhHpcRvWS02", 
                "debit": null
            }, 
            "meta": {}, 
            "transaction_number": "HL500-842-5492", 
            "updated_at": "2014-01-27T22:56:40.238140Z"
        }, 
        {
            "amount": 10000000, 
            "created_at": "2014-01-27T22:55:56.619097Z", 
            "currency": "USD", 
            "description": null, 
            "expires_at": "2014-02-03T22:55:57.540880Z", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/card_holds/HL1pMPzS1JEE4lMCBnKh32Oa", 
            "id": "HL1pMPzS1JEE4lMCBnKh32Oa", 
            "links": {
                "card": "CC1nrXVKmfh0ouOS7zxI6X8q", 
                "debit": "WD1pU48nHJzorOySkTaQGQ9U"
            }, 
            "meta": {}, 
            "transaction_number": "HL464-208-0908", 
            "updated_at": "2014-01-27T22:56:00.845902Z"
        }
    ], 
    "links": {
        "card_holds.card": "/resources/{card_holds.card}", 
        "card_holds.debit": "/debits/{card_holds.debit}", 
        "card_holds.debits": "/card_holds/{card_holds.id}/debits", 
        "card_holds.events": "/card_holds/{card_holds.id}/events"
    }, 
    "meta": {
        "first": "/card_holds?limit=10&offset=0", 
        "href": "/card_holds?limit=10&offset=0", 
        "last": "/card_holds?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 2
    }
}
% endif