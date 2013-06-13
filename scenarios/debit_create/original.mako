<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer.debit(...)

% else:
${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
customer.debit(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)

% endif
