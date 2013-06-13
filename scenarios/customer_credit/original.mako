<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.credit()

% else:
${main.python_boilerplate()}
customer =  balanced.Customer.find('${request['customer_uri']}')
customer.credit(${payload['amount']})

% endif
