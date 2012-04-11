from __future__ import unicode_literals
import pprint

import balanced

balanced.config.root_uri = 'http://localhost:5000/'
balanced.configure('9a2104b0800711e183f168a86d3cb93a')

debit = balanced.Debit.find(uri='/v1/marketplaces/TEST-MP018-081-2437/debits/W488-749-2712')
print debit.refunds
print debit.uri

pprint.pprint([(r.uri, r.debit.uri) for r in debit.refunds])
