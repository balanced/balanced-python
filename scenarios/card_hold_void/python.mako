% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

card_hold = balanced.CardHold.fetch('/card_holds/HL4F8FdmMdyVxzE515FygGd')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'card': u'CC7JlMyXyZ8W3RBfE1SSlnrD', u'debit': None}, amount=5000, created_at=u'2014-04-25T22:00:27.337321Z', updated_at=u'2014-04-25T22:00:28.055030Z', expires_at=u'2014-05-02T22:00:27.441254Z', failure_reason=None, currency=u'USD', transaction_number=u'HL750-788-2579', href=u'/card_holds/HL4F8FdmMdyVxzE515FygGd', meta={}, failure_reason_code=None, voided_at=u'2014-04-25T22:00:28.055033Z', id=u'HL4F8FdmMdyVxzE515FygGd')
% endif