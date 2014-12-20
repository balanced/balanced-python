% if mode == 'definition':
balanced.Account.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

account = balanced.Account.fetch('/accounts/AT2t2NS6otEMnPT0jVuRAE6Y')
% elif mode == 'response':
Account(links={u'customer': u'CU2sWdT0agfxWIbJN2W5LR0k'}, can_credit=True, can_debit=True, created_at=u'2014-12-18T18:20:35.215938Z', updated_at=u'2014-12-18T18:20:35.215939Z', currency=u'USD', href=u'/accounts/AT2t2NS6otEMnPT0jVuRAE6Y', meta={}, balance=0, type=u'payable', id=u'AT2t2NS6otEMnPT0jVuRAE6Y')
% endif