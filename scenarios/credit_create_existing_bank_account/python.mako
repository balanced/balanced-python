<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.BankAccount.credit()

% else:
${main.python_boilerplate()}
bank_account = balanced.BankAccount.find('${request['uri']}')
credit = bank_account.credit(${payload['amount']})

% endif
