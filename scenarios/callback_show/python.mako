% if mode == 'definition':
balanced.Callback.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

callback = balanced.Callback.fetch('/callbacks/CB224374R2NSyoYBpDV4r7C2')
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
    "links": {}
}
% endif