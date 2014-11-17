% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

order = balanced.Order.fetch('/orders/OR5sl2RJVnbwEf45nq5eATdz')
card = balanced.Card.fetch('/cards/CC33DRVrekWpiHYjxSdVuqWc')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR5sl2RJVnbwEf45nq5eATdz'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': u'OR5sl2RJVnbwEf45nq5eATdz', u'card': u'CC33DRVrekWpiHYjxSdVuqWc', u'debit': None}, amount=5000, created_at=u'2014-11-14T19:33:51.879868Z', updated_at=u'2014-11-14T19:33:52.717417Z', expires_at=u'2014-11-21T19:33:52.579614Z', failure_reason=None, currency=u'USD', transaction_number=u'HLS8T-X5S-C9TP', href=u'/card_holds/HLFpnZtmuIk0mVJKtYuaWSQ', meta={}, failure_reason_code=None, voided_at=None, id=u'HLFpnZtmuIk0mVJKtYuaWSQ')
% endif