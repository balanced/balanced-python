% if mode == 'definition':
balanced.Card().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card(
  expiration_month='12',
  security_code='123',
  number='5105105105105100',
  expiration_year='2020'
).save()
% elif mode == 'response':
{
    "cards": [
        {
            "address": {
                "city": null, 
                "country_code": null, 
                "line1": null, 
                "line2": null, 
                "postal_code": null, 
                "state": null
            }, 
            "avs_postal_match": null, 
            "avs_result": null, 
            "avs_street_match": null, 
            "brand": "MasterCard", 
            "created_at": "2014-01-27T22:57:42.092923Z", 
            "cvv": null, 
            "cvv_match": null, 
            "cvv_result": null, 
            "expiration_month": 12, 
            "expiration_year": 2020, 
            "fingerprint": "fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788", 
            "href": "/cards/CC3kqm84fxh50avenrUsSKbu", 
            "id": "CC3kqm84fxh50avenrUsSKbu", 
            "is_verified": true, 
            "links": {
                "customer": null
            }, 
            "meta": {}, 
            "name": null, 
            "number": "xxxxxxxxxxxx5100", 
            "updated_at": "2014-01-27T22:57:42.092926Z"
        }
    ], 
    "links": {
        "cards.card_holds": "/cards/{cards.id}/card_holds", 
        "cards.customer": "/customers/{cards.customer}", 
        "cards.debits": "/cards/{cards.id}/debits"
    }
}
% endif