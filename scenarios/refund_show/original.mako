<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Refund.find

% else:
${main.python_boilerplate()}
refund = balanced.Refund.find("${request['uri']}")

% endif
