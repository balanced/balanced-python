<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Hold.query()

% else:
${main.python_boilerplate()}
holds = balanced.Hold.query.all();

% endif
