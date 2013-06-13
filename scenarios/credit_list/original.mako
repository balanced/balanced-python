<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Credit.query

% else:
${main.python_boilerplate()}
credits = balanced.Credit.query.all()

% endif
