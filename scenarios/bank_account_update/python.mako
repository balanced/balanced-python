% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy')
bank_account.meta = {
  'twitter.id'='1234987650',
  'facebook.user_id'='0192837465',
  'my-own-customer-id'='12345'
}
bank_account.save()
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
            "meta": {
                "facebook.user_id": "0192837465", 
                "my-own-customer-id": "12345", 
                "twitter.id": "1234987650"
            }, 
            "name": "Johann Bernoulli", 
            "routing_number": "121000358", 
            "updated_at": "2014-01-27T22:56:25.767386Z"
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