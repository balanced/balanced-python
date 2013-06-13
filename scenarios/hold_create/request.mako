${main.python_boilerplate()}
customer = balanced.Customer.find('${request['customer_uri']}')
customer.hold(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)