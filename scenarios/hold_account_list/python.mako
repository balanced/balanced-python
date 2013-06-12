<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.holds

% else:
${main.python_boilerplate()}
account = balanced.Account.find('${request['account_uri']}')
holds = account.holds.all()

% endif
