% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

api_key = balanced.APIKey().save()
% elif mode == 'response':
{
    "api_keys": [
        {
            "created_at": "2014-01-27T22:56:01.641736Z", 
            "href": "/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c", 
            "id": "AK1vqjn1eEHXP0JYXrBrjH5c", 
            "links": {}, 
            "meta": {}, 
            "secret": "ak-test-1jlJCdGZjRWWYRF1iLBR69xwqG2NdQifv"
        }
    ], 
    "links": {}
}
% endif