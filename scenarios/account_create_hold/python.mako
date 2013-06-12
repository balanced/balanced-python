<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.debit()

% else:
${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
account.hold(amount='${payload['amount']}')

% endif