% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

key = balanced.APIKey.fetch('/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c')
% elif mode == 'response':
{
    "api_keys": [
        {
            "created_at": "2014-01-27T22:56:01.641736Z", 
            "href": "/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c", 
            "id": "AK1vqjn1eEHXP0JYXrBrjH5c", 
            "links": {}, 
            "meta": {}
        }
    ], 
    "links": {}
}
% endif