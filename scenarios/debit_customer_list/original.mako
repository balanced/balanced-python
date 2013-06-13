<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.debits

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
debits = customer.debits.all()

% endif
