% if mode == 'definition':
balanced.Callback().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

callback = balanced.Callback.fetch('/callbacks/CB3dRHClJeZ4UFqbLZsR6vUW')
callback.unstore()
% endif