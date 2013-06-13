<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.refunds

% else:
${main.python_boilerplate()}
buyer = balanced.Account.find('${request['account_uri']}')
refunds = buyer.refunds.all()

% endif
