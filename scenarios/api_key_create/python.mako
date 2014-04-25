% if mode == 'definition':
balanced.APIKey()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

api_key = balanced.APIKey().save()
% elif mode == 'response':
APIKey(links={}, created_at=u'2014-04-25T20:09:11.537493Z', secret=u'ak-test-2hjXn5Ny6P9aFu5jitCvkF06nNIHc3sYN', href=u'/api_keys/AK3DgZwSCD2ggxGSw1bsiyDX', meta={}, id=u'AK3DgZwSCD2ggxGSw1bsiyDX')
% endif