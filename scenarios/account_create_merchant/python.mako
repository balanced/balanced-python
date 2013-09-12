% if mode == 'definition':
balanced.Account.add_bank_account
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


account = balanced.Account.find('/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/accounts/AC5GKj4twnXFbC4fXnpA9KOY')
account.add_bank_account('/v1/bank_accounts/BA5LWU2iJDGJOOtxlRPW5N8q')
% endif