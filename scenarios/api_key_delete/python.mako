% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

key = balanced.APIKey.fetch('/api_keys/AK2TWX3j6gK68Qk8w4ZEqfmM')
key.delete()
% endif