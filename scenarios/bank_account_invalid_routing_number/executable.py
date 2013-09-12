import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account = balanced.BankAccount(
  routing_number='100000007'
  type='checking'
  account_number='9900000001'
  name='Johann Bernoulli'
)

try:
    bank_account.save()
except balanced.exc.HTTPError, ex:
    assert ex.status_code == 400
    assert 'Routing number is invalid' in ex.description
    assert ex.request_id is not None