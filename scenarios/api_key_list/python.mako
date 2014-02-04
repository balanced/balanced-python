% if mode == 'definition':
balanced.APIKey.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

keys = balanced.APIKey.query
% elif mode == 'response':
{
    "api_keys": [
        {
            "created_at": "2014-01-27T22:56:01.641736Z", 
            "href": "/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c", 
            "id": "AK1vqjn1eEHXP0JYXrBrjH5c", 
            "links": {}, 
            "meta": {}
        }, 
        {
            "created_at": "2014-01-27T22:55:46.698536Z", 
            "href": "/api_keys/AK1eDKn7B8vK70hj70S1NMbu", 
            "id": "AK1eDKn7B8vK70hj70S1NMbu", 
            "links": {}, 
            "meta": {}, 
            "secret": "ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc"
        }
    ], 
    "links": {}, 
    "meta": {
        "first": "/api_keys?limit=10&offset=0", 
        "href": "/api_keys?limit=10&offset=0", 
        "last": "/api_keys?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 2
    }
}
% endif