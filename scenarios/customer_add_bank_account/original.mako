<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.add_bank_account

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
customer.add_bank_account('${payload['bank_account_uri']}')

% endif
