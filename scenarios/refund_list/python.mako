<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Refund.query()

% else:
${main.python_boilerplate()}
refunds = balanced.Refund.query.all();

% endif
