% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card_hold = balanced.CardHold.fetch('/card_holds/HL2F8jlnySjVKidwfXgBYZMY')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC2E1bHjwNbYtzUcTAmH4kEM', u'debit': None}, amount=5000, created_at=u'2014-11-14T19:28:32.378595Z', updated_at=u'2014-11-14T19:28:32.934510Z', expires_at=u'2014-11-21T19:28:32.843418Z', failure_reason=None, currency=u'USD', transaction_number=u'HL0SV-779-FT23', href=u'/card_holds/HL2F8jlnySjVKidwfXgBYZMY', meta={}, failure_reason_code=None, voided_at=None, id=u'HL2F8jlnySjVKidwfXgBYZMY')
% endif