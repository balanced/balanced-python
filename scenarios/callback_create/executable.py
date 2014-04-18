import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()