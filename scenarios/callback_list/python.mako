% if mode == 'definition':
balanced.Callback.query

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callbacks = balanced.Callback.query
% elif mode == 'response':
{
    "callbacks": [
        {
            "href": "/callbacks/CB224374R2NSyoYBpDV4r7C2", 
            "id": "CB224374R2NSyoYBpDV4r7C2", 
            "links": {}, 
            "method": "post", 
            "revision": "1.1", 
            "url": "http://www.example.com/callback"
        }
    ], 
    "links": {}, 
    "meta": {
        "first": "/callbacks?limit=10&offset=0", 
        "href": "/callbacks?limit=10&offset=0", 
        "last": "/callbacks?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 1
    }
}
% endif