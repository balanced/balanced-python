% if mode == 'definition':
balanced.APIKey

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

api_key = balanced.APIKey()
api_key.save()
% endif