<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.holds

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
holds = customer.holds.all()

% endif
