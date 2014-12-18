% if mode == 'definition':
balanced.Account.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

account = balanced.Account.fetch('/accounts/AT3Se8weBm42ATmTA2bXjm73')
% elif mode == 'response':
Account(links={u'customer': u'CU3S7fOsPFkXduxLsRZgF57D'}, can_credit=True, can_debit=True, created_at=u'2014-12-17T00:36:25.254068Z', updated_at=u'2014-12-17T00:36:25.254070Z', currency=u'USD', href=u'/accounts/AT3Se8weBm42ATmTA2bXjm73', meta={}, balance=0, type=u'payable', id=u'AT3Se8weBm42ATmTA2bXjm73')
% endif