% if mode == 'definition':
balanced.Card.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

cards = balanced.Card.query
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
            "created_at": "2014-01-27T22:56:55.656375Z", 
            "cvv": null, 
            "cvv_match": null, 
            "cvv_result": null, 
            "expiration_month": 12, 
            "expiration_year": 2020, 
            "fingerprint": "fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788", 
            "href": "/cards/CC2uc8iPDjgyxOXHVtnZloyI", 
            "id": "CC2uc8iPDjgyxOXHVtnZloyI", 
            "is_verified": true, 
            "links": {
                "customer": null
            }, 
            "meta": {}, 
            "name": null, 
            "number": "xxxxxxxxxxxx5100", 
            "updated_at": "2014-01-27T22:56:55.656379Z"
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
            "avs_postal_match": null, 
            "avs_result": null, 
            "avs_street_match": null, 
            "brand": "MasterCard", 
            "created_at": "2014-01-27T22:56:37.869483Z", 
            "cvv": null, 
            "cvv_match": null, 
            "cvv_result": null, 
            "expiration_month": 12, 
            "expiration_year": 2020, 
            "fingerprint": "fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788", 
            "href": "/cards/CC2abDOQVm5aNFhHpcRvWS02", 
            "id": "CC2abDOQVm5aNFhHpcRvWS02", 
            "is_verified": true, 
            "links": {
                "customer": "CU1f8Ygc4t0F2FKNcw235x9I"
            }, 
            "meta": {}, 
            "name": null, 
            "number": "xxxxxxxxxxxx5100", 
            "updated_at": "2014-01-27T22:56:39.354525Z"
        }, 
        {
            "address": {
                "city": null, 
                "country_code": "USA", 
                "line1": null, 
                "line2": null, 
                "postal_code": "10023", 
                "state": null
            }, 
            "avs_postal_match": "yes", 
            "avs_result": "Postal code matches, but street address not verified.", 
            "avs_street_match": null, 
            "brand": "Visa", 
            "created_at": "2014-01-27T22:55:54.558589Z", 
            "cvv": null, 
            "cvv_match": null, 
            "cvv_result": null, 
            "expiration_month": 4, 
            "expiration_year": 2016, 
            "fingerprint": "979a26c05f2fb1c7ae38656312b176da2c9be1d938d442040bc79539caac6c0d", 
            "href": "/cards/CC1nrXVKmfh0ouOS7zxI6X8q", 
            "id": "CC1nrXVKmfh0ouOS7zxI6X8q", 
            "is_verified": true, 
            "links": {
                "customer": "CU1iDnBalzHoZg47Np92rNrV"
            }, 
            "meta": {}, 
            "name": "Benny Riemann", 
            "number": "xxxxxxxxxxxx1111", 
            "updated_at": "2014-01-27T22:55:54.558592Z"
        }
    ], 
    "links": {
        "cards.card_holds": "/cards/{cards.id}/card_holds", 
        "cards.customer": "/customers/{cards.customer}", 
        "cards.debits": "/cards/{cards.id}/debits"
    }, 
    "meta": {
        "first": "/cards?limit=10&offset=0", 
        "href": "/cards?limit=10&offset=0", 
        "last": "/cards?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 3
    }
}
% endif