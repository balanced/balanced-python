% if mode == 'definition':

balanced.Credit.save()
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


bank_account_info = dict(
    routing_number='121000358',
    type='checking',
    account_number='9900000003',
    name='Johann Bernoulli',
)
credit = balanced.Credit(
    amount=10000,
    bank_account=bank_account_info
).save()

% endif