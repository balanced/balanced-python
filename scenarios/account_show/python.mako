% if mode == 'definition':
balanced.Account.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

account = balanced.Account.fetch('/accounts/AT2V7l4MoUJH8xDse641Xqog')
% elif mode == 'response':
Account(links={u'customer': u'CU2V0zJeFwPUCzJsaK48Ly3S'}, can_credit=True, can_debit=True, created_at=u'2015-01-09T03:22:20.308375Z', updated_at=u'2015-01-09T03:22:20.308376Z', currency=u'USD', href=u'/accounts/AT2V7l4MoUJH8xDse641Xqog', meta={}, balance=0, type=u'payable', id=u'AT2V7l4MoUJH8xDse641Xqog')
% endif