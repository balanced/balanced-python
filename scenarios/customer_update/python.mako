% if mode == 'definition':
balanced.Customer().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customer = balanced.Debit.fetch('/customers/CU33Y4cut21qu1d1lGYDBseQ')
customer.email = 'email@newdomain.com'
customer.meta = {
  'shipping-preference': 'ground'
}
customer.save()
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
            "email": "email@newdomain.com", 
            "href": "/customers/CU33Y4cut21qu1d1lGYDBseQ", 
            "id": "CU33Y4cut21qu1d1lGYDBseQ", 
            "links": {
                "destination": null, 
                "source": null
            }, 
            "merchant_status": "underwritten", 
            "meta": {
                "shipping-preference": "ground"
            }, 
            "name": "Henry Ford", 
            "phone": null, 
            "ssn_last4": null, 
            "updated_at": "2014-01-27T22:57:34.512310Z"
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
}
% endif