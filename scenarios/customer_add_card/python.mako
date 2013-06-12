<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.add_card

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['uri']}')
customer.add_card('${payload['card_uri']}')

% endif
