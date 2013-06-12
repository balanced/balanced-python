<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.debit()

% else:
${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
account.debit(amount='${payload['amount']}')

% endif
