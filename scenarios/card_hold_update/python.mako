% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_hold = balanced.CardHold.fetch('/card_holds/HL4iHX8OBNW7nVsu6MqyjnQ9')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'update this description', links={u'order': None, u'card': u'CC3vhL91rWtwtHcOBl0ITshG', u'debit': None}, amount=5000, created_at=u'2015-01-09T03:23:36.391121Z', updated_at=u'2015-01-09T03:23:42.106452Z', expires_at=u'2015-01-16T03:23:36.585031Z', failure_reason=None, currency=u'USD', transaction_number=u'HLI6T-T0A-HGZI', href=u'/card_holds/HL4iHX8OBNW7nVsu6MqyjnQ9', meta={u'holding.for': u'user1', u'meaningful.key': u'some.value'}, failure_reason_code=None, voided_at=None, id=u'HL4iHX8OBNW7nVsu6MqyjnQ9')
% endif