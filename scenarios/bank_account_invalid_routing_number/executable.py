import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

bank_account = balanced.BankAccount(
  routing_number='111111118',
  type='checking',
  account_number='9900000001',
  name='Johann Bernoulli'
)

try:
    bank_account.save()
except balanced.exc.HTTPError, ex:
    assert ex.status_code == 400
    assert 'Routing number is invalid' in ex.description
    assert ex.request_id is not None