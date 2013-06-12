<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.hold(...)

% else:
${main.python_boilerplate()}
buyer = balanced.Account.find('${request['account_uri']}')
buyer.hold(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)

% endif
