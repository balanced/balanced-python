<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Debit.query()

% else:
${main.python_boilerplate()}
debits = balanced.Debit.query.all();

% endif
