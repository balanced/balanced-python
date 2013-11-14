% if mode == 'definition':
balanced.Credit.save()
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_account_info = {
    "routing_number": "121000358", 
    "type": "checking", 
    "account_number": "9900000003", 
    "name": "Johann Bernoulli"
}

credit = balanced.Credit(
    amount=10000,
    bank_account=bank_account_info
).save()
% endif