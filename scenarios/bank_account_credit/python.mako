% if mode == 'definition':
balanced.BankAccount().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA3qNbYRqFM0Q7MXn3IcjGl0')
bank_account.credit(
  amount=5000
)
% elif mode == 'response':
Credit(**{
 'amount': 5000,
 'appears_on_statement_as': u'example.com',
 'created_at': u'2014-01-27T22:58:19.422292Z',
 'currency': u'USD',
 'description': None,
 'failure_reason': None,
 'failure_reason_code': None,
 'href': u'/credits/CR40neytmVG2HDBp1opfF7sY',
 'id': u'CR40neytmVG2HDBp1opfF7sY',
 'links': {u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg',
           u'destination': u'BA3qNbYRqFM0Q7MXn3IcjGl0',
           u'order': None},
 'meta': {},
 'status': u'succeeded',
 'transaction_number': u'CR816-868-3666',
 'updated_at': u'2014-01-27T22:58:20.346871Z'
})
% endif