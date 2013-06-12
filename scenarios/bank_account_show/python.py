import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA2fU4b0MNuBHuI3NrvyOsTE")


./render `pwd`/scenario.cache account_add_card

clients/python/account_add_card/account_add_card.py

cat     clients/python/account_add_card/account_add_card.py

import balanced

balanced.configure("2fd37702d33511e2a00f026ba7d31e6f")


account = balanced.Account.find('/v1/marketplaces/TEST-MP1sqiJRpcbwFbP7ihahsjCG/accounts/AC1QTKcWo0yb9qxov4B2rVIC')
account.add_card('/v1/marketplaces/TEST-MP1sqiJRpcbwFbP7ihahsjCG/cards/CC1ScWdon0LVMYfeHpDOLNm6')