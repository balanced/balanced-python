% if mode == 'definition':
balanced.Reversal.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

refund = balanced.Reversal.fetch('/reversals/RV6OCxJ1UhkG84is6H9PHjkZ')
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'Reversal for Order #1111', links={u'credit': u'CR6NpuEtezCdLTYngDrSEODv', u'order': None}, amount=3000, created_at=u'2014-03-06T19:23:55.596399Z', updated_at=u'2014-03-06T19:23:56.470321Z', failure_reason=None, currency=u'USD', transaction_number=u'RV542-861-3670', href=u'/reversals/RV6OCxJ1UhkG84is6H9PHjkZ', meta={u'fulfillment.item.condition': u'OK', u'user.refund_reason': u'not happy with product', u'merchant.feedback': u'positive'}, failure_reason_code=None, id=u'RV6OCxJ1UhkG84is6H9PHjkZ')
% endif