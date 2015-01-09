import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

callback = balanced.Callback(
  url='http://www.example.com/callback_test',
  method='post'
).save()