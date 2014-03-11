% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

reversal = balanced.Reversal.fetch('/reversals/RV6OCxJ1UhkG84is6H9PHjkZ')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
Reversal(status=u'succeeded', description=u'update this description', links={u'credit': u'CR6NpuEtezCdLTYngDrSEODv', u'order': None}, amount=3000, created_at=u'2014-03-06T19:23:55.596399Z', updated_at=u'2014-03-06T19:24:00.271458Z', failure_reason=None, currency=u'USD', transaction_number=u'RV542-861-3670', href=u'/reversals/RV6OCxJ1UhkG84is6H9PHjkZ', meta={u'user.satisfaction': u'6', u'refund.reason': u'user not happy with product', u'user.notes': u'very polite on the phone'}, failure_reason_code=None, id=u'RV6OCxJ1UhkG84is6H9PHjkZ')
% endif