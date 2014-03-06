% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()
% endif