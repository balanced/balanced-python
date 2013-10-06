import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

bank_account_info = {
    "routing_number": "121000358", 
    "type": "checking", 
    "account_number": "9900000002", 
    "name": "Johann Bernoulli"
}

credit = balanced.Credit(
    amount=10000,
    bank_account=bank_account_info
).save()