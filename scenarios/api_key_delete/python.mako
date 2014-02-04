% if mode == 'definition':
balanced.APIKey().delete()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

key = balanced.APIKey.fetch('/api_keys/AK1vqjn1eEHXP0JYXrBrjH5c')
key.delete()
% elif mode == 'response':
{}
% endif