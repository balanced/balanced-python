import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account_info = {
    "routing_number": "121000358", 
    "type": "checking", 
    "account_number": "9900000001", 
    "name": "Johann Bernoulli"
}

credit = balanced.Credit(
    amount=10000,
    bank_account=bank_account_info
).save()