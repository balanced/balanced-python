% if mode == 'definition':
balanced.Card().credit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC3iCCIHprJu5HPyP7vmE92B')
card.credit(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Credit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': u'CU2718cI8PkMdFyPjboZLZfn', u'destination': u'CC3iCCIHprJu5HPyP7vmE92B', u'order': None}, amount=5000, created_at=u'2014-11-14T19:29:19.110285Z', updated_at=u'2014-11-14T19:29:19.965523Z', failure_reason=None, currency=u'USD', transaction_number=u'CR6R4-4OF-RNZ7', href=u'/credits/CR3vFNFFCyqipPjs5t4eaIVO', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR3vFNFFCyqipPjs5t4eaIVO')
% endif