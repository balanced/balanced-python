import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()