<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.refunds

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
refunds = customer.refunds.all()

% endif
