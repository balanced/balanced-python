import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC6vNITlEx4Uq6NM04q9ykre/credits')
credits = customer.credits.all()