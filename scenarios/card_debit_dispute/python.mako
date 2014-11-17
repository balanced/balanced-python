% if mode == 'definition':
balanced.Card().debit()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC4wj9Lfvka6iodY7jzyqSHe')
card.debit(
  appears_on_statement_as='Statement text',
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC4wj9Lfvka6iodY7jzyqSHe', u'dispute': None, u'order': None, u'card_hold': u'HL4xdJNOGHFS5KWwZUoPCUbX'}, amount=5000, created_at=u'2014-11-14T19:30:15.656004Z', updated_at=u'2014-11-14T19:30:24.023216Z', failure_reason=None, currency=u'USD', transaction_number=u'WQ3W-26G-HADQ', href=u'/debits/WD4xfFIxpeQpeRHm55Qc2xV3', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD4xfFIxpeQpeRHm55Qc2xV3')
% endif