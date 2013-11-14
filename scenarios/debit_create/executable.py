import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU35rlJBXqlvD9LC26PWu0cy')
customer.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)