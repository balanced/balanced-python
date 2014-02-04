% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1D3vL3LjasB0kewMqRGI0S')
verification = bank_account.verify()
% elif mode == 'response':
{
    "bank_account_verifications": [
        {
            "attempts": 0, 
            "attempts_remaining": 3, 
            "created_at": "2014-01-27T22:56:10.726455Z", 
            "deposit_status": "succeeded", 
            "href": "/verifications/BZ1FF2MHFH9upRu7C0QUwnby", 
            "id": "BZ1FF2MHFH9upRu7C0QUwnby", 
            "links": {
                "bank_account": "BA1D3vL3LjasB0kewMqRGI0S"
            }, 
            "meta": {}, 
            "updated_at": "2014-01-27T22:56:12.545750Z", 
            "verification_status": "pending"
        }
    ], 
    "links": {
        "bank_account_verifications.bank_account": "/bank_accounts/{bank_account_verifications.bank_account}"
    }
}
% endif