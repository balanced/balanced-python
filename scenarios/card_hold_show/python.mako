% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_hold = balanced.CardHold.fetch('/card_holds/HL4iHX8OBNW7nVsu6MqyjnQ9')
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC3vhL91rWtwtHcOBl0ITshG', u'debit': None}, amount=5000, created_at=u'2015-01-09T03:23:36.391121Z', updated_at=u'2015-01-09T03:23:36.674542Z', expires_at=u'2015-01-16T03:23:36.585031Z', failure_reason=None, currency=u'USD', transaction_number=u'HLI6T-T0A-HGZI', href=u'/card_holds/HL4iHX8OBNW7nVsu6MqyjnQ9', meta={}, failure_reason_code=None, voided_at=None, id=u'HL4iHX8OBNW7nVsu6MqyjnQ9')
% endif