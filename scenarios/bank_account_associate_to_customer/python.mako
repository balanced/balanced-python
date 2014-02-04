% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0')
card.associate_to_customer('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
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
            "created_at": "2014-01-27T22:57:47.772481Z", 
            "fingerprint": "5f0ba9fa3f1122ef13b944a40abfe44e7eba9e16934e64200913cb4c402ace14", 
            "href": "/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0", 
            "id": "BA3qNbYRqFM0Q7MXn3IcjGl0", 
            "links": {
                "bank_account_verification": null, 
                "customer": "CU3eeasZ9yQ86uzzIYZkrPGg"
            }, 
            "meta": {}, 
            "name": "Johann Bernoulli", 
            "routing_number": "121000358", 
            "updated_at": "2014-01-27T22:57:48.515195Z"
        }
    ], 
    "links": {
        "bank_accounts.bank_account_verification": "/verifications/{bank_accounts.bank_account_verification}", 
        "bank_accounts.bank_account_verifications": "/bank_accounts/{bank_accounts.id}/verifications", 
        "bank_accounts.credits": "/bank_accounts/{bank_accounts.id}/credits", 
        "bank_accounts.customer": "/customers/{bank_accounts.customer}", 
        "bank_accounts.debits": "/bank_accounts/{bank_accounts.id}/debits"
    }
}
% endif