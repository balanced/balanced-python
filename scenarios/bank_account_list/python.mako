% if mode == 'definition':
balanced.BankAccount.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_accounts = balanced.BankAccount.query
% elif mode == 'response':
{
    "bank_accounts": [
        {
            "account_number": "xxxxxx0001", 
            "account_type": "checking", 
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": null, 
                "state": null
            }, 
            "bank_name": "BANK OF AMERICA, N.A.", 
            "can_credit": true, 
            "can_debit": false, 
            "created_at": "2014-01-27T22:56:20.540530Z", 
            "fingerprint": "5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14", 
            "href": "/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy", 
            "id": "BA1QFf0LmIxr8p41msqX46Oy", 
            "links": {
                "bank_account_verification": null, 
                "customer": null
            }, 
            "meta": {}, 
            "name": "Johann Bernoulli", 
            "routing_number": "121000358", 
            "updated_at": "2014-01-27T22:56:20.540534Z"
        }, 
        {
            "account_number": "xxxxxx0001", 
            "account_type": "checking", 
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": null, 
                "state": null
            }, 
            "bank_name": "BANK OF AMERICA, N.A.", 
            "can_credit": true, 
            "can_debit": true, 
            "created_at": "2014-01-27T22:56:08.446352Z", 
            "fingerprint": "5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14", 
            "href": "/bank_accounts/BA1D3vL3LjasB0kewMqRGI0S", 
            "id": "BA1D3vL3LjasB0kewMqRGI0S", 
            "links": {
                "bank_account_verification": "BZ1FF2MHFH9upRu7C0QUwnby", 
                "customer": null
            }, 
            "meta": {}, 
            "name": "Johann Bernoulli", 
            "routing_number": "121000358", 
            "updated_at": "2014-01-27T22:56:18.623674Z"
        }, 
        {
            "account_number": "xxxxxxxxxxx5555", 
            "account_type": "checking", 
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": null, 
                "state": null
            }, 
            "bank_name": "WELLS FARGO BANK NA", 
            "can_credit": true, 
            "can_debit": true, 
            "created_at": "2014-01-27T22:55:49.899228Z", 
            "fingerprint": "6ybvaLUrJy07phK2EQ7pVk", 
            "href": "/bank_accounts/BA1fUvPHaEcIdkRe8HmC2Vee", 
            "id": "BA1fUvPHaEcIdkRe8HmC2Vee", 
            "links": {
                "bank_account_verification": null, 
                "customer": "CU1f8Ygc4t0F2FKNcw235x9I"
            }, 
            "meta": {}, 
            "name": "TEST-MERCHANT-BANK-ACCOUNT", 
            "routing_number": "121042882", 
            "updated_at": "2014-01-27T22:55:49.899231Z"
        }
    ], 
    "links": {
        "bank_accounts.bank_account_verification": "/verifications/{bank_accounts.bank_account_verification}", 
        "bank_accounts.bank_account_verifications": "/bank_accounts/{bank_accounts.id}/verifications", 
        "bank_accounts.credits": "/bank_accounts/{bank_accounts.id}/credits", 
        "bank_accounts.customer": "/customers/{bank_accounts.customer}", 
        "bank_accounts.debits": "/bank_accounts/{bank_accounts.id}/debits"
    }, 
    "meta": {
        "first": "/bank_accounts?limit=10&offset=0", 
        "href": "/bank_accounts?limit=10&offset=0", 
        "last": "/bank_accounts?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 3
    }
}
% endif