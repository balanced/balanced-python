% if mode == 'definition':
balanced.Callback()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

callback = balanced.Callback(
  url='http://www.example.com/callback',
  method='post'
).save()
% elif mode == 'response':
Callback(links={}, url=u'http://www.example.com/callback', id=u'CB52j36ilEVeALiL9ABZ0Jl6', href=u'/callbacks/CB52j36ilEVeALiL9ABZ0Jl6', method=u'post', revision=u'1.1')
% endif