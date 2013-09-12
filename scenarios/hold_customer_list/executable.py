import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


customer = balanced.Customer.find('/v1/customers/AC7dx1IBJGzHjr579XEZAvLc/holds')
holds = customer.holds.all()