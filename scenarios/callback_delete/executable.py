import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

callback = balanced.Callback.find('/v1/callbacks/CB18dXR1zGLZeawfMBIOPVYs')
callback.unstore()