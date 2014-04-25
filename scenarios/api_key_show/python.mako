% if mode == 'definition':
balanced.APIKey.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

key = balanced.APIKey.fetch('/api_keys/AK3DgZwSCD2ggxGSw1bsiyDX')
% elif mode == 'response':
APIKey(created_at=u'2014-04-25T20:09:11.537493Z', href=u'/api_keys/AK3DgZwSCD2ggxGSw1bsiyDX', meta={}, id=u'AK3DgZwSCD2ggxGSw1bsiyDX', links={})
% endif