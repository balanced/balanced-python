% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

key = balanced.APIKey.fetch('/api_keys/AK3DQGzROuoRYulKXMQdHBxX')
key.delete()
% elif mode == 'response':

% endif