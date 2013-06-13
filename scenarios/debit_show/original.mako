<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Debit.find

% else:
${main.python_boilerplate()}
debit = balanced.Debit.find("${request['uri']}")

% endif
