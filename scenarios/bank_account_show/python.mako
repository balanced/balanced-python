<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.BankAccount.find
% else:
${main.python_boilerplate()}
bank_account = balanced.BankAccount.find("${request['uri']}")
% endif


./render `pwd`/scenario.cache account_add_card

clients/python/account_add_card/account_add_card.py

cat     clients/python/account_add_card/account_add_card.py

import balanced

balanced.configure("2fd37702d33511e2a00f026ba7d31e6f")


account = balanced.Account.find('/v1/marketplaces/TEST-MP1sqiJRpcbwFbP7ihahsjCG/accounts/AC1QTKcWo0yb9qxov4B2rVIC')
account.add_card('/v1/marketplaces/TEST-MP1sqiJRpcbwFbP7ihahsjCG/cards/CC1ScWdon0LVMYfeHpDOLNm6')