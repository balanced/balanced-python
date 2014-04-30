% if mode == 'definition':
balanced.Order().debit()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

order = balanced.Order.fetch('/orders/OR1s2WQKp0shLH9Qb0LiUfEJ')
card = balanced.Card.fetch('/cards/CC1r57n36Fbiglw0OcSEkUcN')
order.debit_from(
    amount='5000',
    source=card,
)
% elif mode == 'response':
Debit(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'customer': None, u'source': u'CC1r57n36Fbiglw0OcSEkUcN', u'order': u'OR1s2WQKp0shLH9Qb0LiUfEJ', u'dispute': None}, amount=5000, created_at=u'2014-04-30T04:52:09.695985Z', updated_at=u'2014-04-30T04:52:10.318488Z', failure_reason=None, currency=u'USD', transaction_number=u'W234-839-6815', href=u'/debits/WD1skUovzVKZUpVnH2lhV965', meta={}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD1skUovzVKZUpVnH2lhV965')
% endif