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
{u'status': u'succeeded', u'description': None, u'links': {u'customer': u'CU3eeasZ9yQ86uzzIYZkrPGg', u'destination': u'BA3qNbYRqFM0Q7MXn3IcjGl0', u'order': None}, u'href': u'/credits/CR40neytmVG2HDBp1opfF7sY', u'created_at': u'2014-01-27T22:58:19.422292Z', u'transaction_number': u'CR816-868-3666', u'failure_reason': None, u'updated_at': u'2014-01-27T22:58:20.346871Z', u'currency': u'USD', u'amount': 5000, u'failure_reason_code': None, u'meta': {}, u'appears_on_statement_as': u'example.com', u'id': u'CR40neytmVG2HDBp1opfF7sY'}
% endif