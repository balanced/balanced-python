<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.debit()

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
customer.debit(amount=${payload['amount']}, hold_uri='${payload['hold_uri']}')

% endif
