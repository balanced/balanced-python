% if mode == 'definition':
balanced.Debit().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

debit = balanced.Debit.fetch('/debits/WD5EW7vbyXlTsudIGF5AkrEA')
debit.description = 'New description for debit'
debit.meta = {
  'facebook.id': '1234567890',
  'anykey': 'valuegoeshere',
}
debit.save()
% elif mode == 'response':
Debit(status=u'succeeded', description=u'New description for debit', links={u'customer': None, u'source': u'CC4zyuNpxY0A0eAf87SeULCR', u'dispute': None, u'order': None, u'card_hold': u'HL5EUR5M3MniPMPUQM0hDdeg'}, amount=5000, created_at=u'2015-01-09T03:24:51.290112Z', updated_at=u'2015-01-09T03:24:56.837641Z', failure_reason=None, currency=u'USD', transaction_number=u'WMBW-XBR-0C9N', href=u'/debits/WD5EW7vbyXlTsudIGF5AkrEA', meta={u'facebook.id': u'1234567890', u'anykey': u'valuegoeshere'}, failure_reason_code=None, appears_on_statement_as=u'BAL*Statement text', id=u'WD5EW7vbyXlTsudIGF5AkrEA')
% endif