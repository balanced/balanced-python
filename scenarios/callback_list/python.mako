<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Callback.query

% else:
${main.python_boilerplate()}
callbacks = balanced.Callback.query.all();
% endif
