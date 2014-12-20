% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

order = balanced.Order.fetch('/orders/OR2JfBYxYlDAF3L48u9DtIEU')
card = balanced.Card.fetch('/cards/CC2IDFuWSoETEIxLBJ73fXgs')
card_hold = card.hold(
amount=5000,
  description='Some descriptive text for the debit in the dashboard',
  order='/orders/OR2JfBYxYlDAF3L48u9DtIEU'
)
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': u'OR2JfBYxYlDAF3L48u9DtIEU', u'card': u'CC2IDFuWSoETEIxLBJ73fXgs', u'debit': None}, amount=5000, created_at=u'2014-12-18T18:21:48.126971Z', updated_at=u'2014-12-18T18:21:48.423243Z', expires_at=u'2014-12-25T18:21:48.337520Z', failure_reason=None, currency=u'USD', transaction_number=u'HLPGD-NVZ-MUDC', href=u'/card_holds/HL3N5iKVsnaRMt2H4LXOBACF', meta={}, failure_reason_code=None, voided_at=None, id=u'HL3N5iKVsnaRMt2H4LXOBACF')
% endif