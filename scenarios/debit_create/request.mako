${main.python_boilerplate()}
buyer = balanced.Account.find('${request['account_uri']}')
buyer.debit(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)