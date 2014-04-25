% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

key = balanced.APIKey.fetch('/api_keys/AK3DgZwSCD2ggxGSw1bsiyDX')
key.delete()
% elif mode == 'response':

% endif