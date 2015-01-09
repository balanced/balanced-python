% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

credit = balanced.Credit.fetch('/credits/CR4RdgCoOqYhr4sjPdcDjf3T')
% elif mode == 'response':
Credit(status=u'pending', description=None, links={u'customer': u'CU3o1ZAd8Gtxz6ZTIFK9YmsM', u'destination': u'BA45anEaEr8g0lOhzhcE9VAN', u'order': None}, amount=5000, created_at=u'2015-01-09T03:24:07.078171Z', updated_at=u'2015-01-09T03:24:07.425391Z', failure_reason=None, currency=u'USD', transaction_number=u'CRGY7-P5M-OXHO', href=u'/credits/CR4RdgCoOqYhr4sjPdcDjf3T', meta={}, failure_reason_code=None, appears_on_statement_as=u'example.com', id=u'CR4RdgCoOqYhr4sjPdcDjf3T')
% endif