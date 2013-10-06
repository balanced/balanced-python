import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

callback = balanced.Callback.find('/v1/callbacks/CB6DYHGJOCaSxYwDz34j5TGa')
callback.unstore()