% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card_hold = balanced.CardHold.fetch('/card_holds/HL2F8jlnySjVKidwfXgBYZMY')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'order': None, u'card': u'CC2E1bHjwNbYtzUcTAmH4kEM', u'debit': None}, amount=5000, created_at=u'2014-11-14T19:28:32.378595Z', updated_at=u'2014-11-14T19:28:38.296215Z', expires_at=u'2014-11-21T19:28:32.843418Z', failure_reason=None, currency=u'USD', transaction_number=u'HL0SV-779-FT23', href=u'/card_holds/HL2F8jlnySjVKidwfXgBYZMY', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL2F8jlnySjVKidwfXgBYZMY')
% endif