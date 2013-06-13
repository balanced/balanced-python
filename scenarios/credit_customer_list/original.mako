<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.credits

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
credits = customer.credits.all()

% endif
