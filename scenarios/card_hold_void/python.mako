% if mode == 'definition':
balanced.CardHold().cancel()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

card_hold = balanced.CardHold.fetch('/card_holds/HL5usZqQ94C25Cv0kmFDJYZD')
card_hold.cancel()
% elif mode == 'response':
CardHold(status=u'succeeded', description=u'Some descriptive text for the debit in the dashboard', links={u'order': None, u'card': u'CC47wPIfNkploi0BbLRDqEYo', u'debit': None}, amount=5000, created_at=u'2014-12-17T00:37:54.353032Z', updated_at=u'2014-12-17T00:37:55.512113Z', expires_at=u'2014-12-24T00:37:54.509183Z', failure_reason=None, currency=u'USD', transaction_number=u'HLMN4-VY4-SQ2M', href=u'/card_holds/HL5usZqQ94C25Cv0kmFDJYZD', meta={}, failure_reason_code=None, voided_at=u'2014-12-17T00:37:55.156072Z', id=u'HL5usZqQ94C25Cv0kmFDJYZD')
% endif