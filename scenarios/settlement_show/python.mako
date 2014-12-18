% if mode == 'definition':
balanced.Settlement.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

account = balanced.Settlement.fetch('/settlements/ST1VhpiMiUv5BrcvJW2G1RgV')
% elif mode == 'response':
Settlement(status=u'pending', description=u'Payout A', links={u'source': u'AT43cMKrvwKEJnV5qX8wCqY0', u'destination': u'BA4UZsYXpf2BX97v5WPaT57O'}, amount=1000, created_at=u'2014-12-17T00:41:47.217019Z', updated_at=u'2014-12-17T00:41:47.572024Z', failure_reason=None, currency=u'USD', transaction_number=u'SCS5W-R1T-GNLH', href=u'/settlements/ST1VhpiMiUv5BrcvJW2G1RgV', meta={u'group': u'alpha'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ThingsCo', id=u'ST1VhpiMiUv5BrcvJW2G1RgV')
% endif