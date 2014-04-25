% if mode == 'definition':
balanced.Event.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

event = balanced.Event.fetch('/events/EV754ca810ccb511e3b6ef061e5f402045')
% elif mode == 'response':
Event(links={}, occurred_at=u'2014-04-25T20:09:08.031000Z', entity={u'bank_accounts': [{u'routing_number': u'121042882', u'bank_name': u'WELLS FARGO BANK NA', u'account_type': u'CHECKING', u'name': u'TEST-MERCHANT-BANK-ACCOUNT', u'links': {u'customer': u'CU3z3rwGWGazDwwyLy0rNqfj', u'bank_account_verification': None}, u'can_credit': True, u'created_at': u'2014-04-25T20:09:08.031387Z', u'fingerprint': u'6ybvaLUrJy07phK2EQ7pVk', u'updated_at': u'2014-04-25T20:09:08.031391Z', u'href': u'/bank_accounts/BA3z8ko53HDEFwxjmNlc998p', u'meta': {}, u'account_number': u'xxxxxxxxxxx5555', u'address': {u'city': None, u'line2': None, u'line1': None, u'state': None, u'postal_code': None, u'country_code': None}, u'can_debit': True, u'id': u'BA3z8ko53HDEFwxjmNlc998p'}], u'links': {u'bank_accounts.debits': u'/bank_accounts/{bank_accounts.id}/debits', u'bank_accounts.credits': u'/bank_accounts/{bank_accounts.id}/credits', u'bank_accounts.bank_account_verifications': u'/bank_accounts/{bank_accounts.id}/verifications', u'bank_accounts.customer': u'/customers/{bank_accounts.customer}', u'bank_accounts.bank_account_verification': u'/verifications/{bank_accounts.bank_account_verification}'}}, href=u'/events/EV754ca810ccb511e3b6ef061e5f402045', callback_statuses={u'failed': 0, u'retrying': 0, u'succeeded': 0, u'pending': 0}, type=u'bank_account.created', id=u'EV754ca810ccb511e3b6ef061e5f402045')
% endif