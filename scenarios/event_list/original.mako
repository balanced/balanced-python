<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
    balanced.Event.query

% else:
${main.python_boilerplate()}
callbacks = balanced.Event.query.all();

% endif
