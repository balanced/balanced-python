% if mode == 'definition':
balanced.Settlement.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

account = balanced.Settlement.fetch('/settlements/ST5xMBEiT3t2Stt2ia4Svl2d')
% elif mode == 'response':
Settlement(status=u'pending', description=u'Payout A', links={u'source': u'AT2E6Ju62P9AnTJwe0fL5kOI', u'destination': u'BA3uzbngfVXy1SGg25Et7iKY'}, amount=1000, created_at=u'2014-12-18T18:23:24.786699Z', updated_at=u'2014-12-18T18:23:25.117077Z', failure_reason=None, currency=u'USD', transaction_number=u'SCJUK-XJN-S1O5', href=u'/settlements/ST5xMBEiT3t2Stt2ia4Svl2d', meta={u'group': u'alpha'}, failure_reason_code=None, appears_on_statement_as=u'BAL*ThingsCo', id=u'ST5xMBEiT3t2Stt2ia4Svl2d')
% endif