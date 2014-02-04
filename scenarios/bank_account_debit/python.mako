% if mode == 'definition':
balanced.BankAccount().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1D3vL3LjasB0kewMqRGI0S')
bank_account.debit(
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