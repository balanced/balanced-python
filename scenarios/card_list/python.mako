<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Card.query()

% else:
${main.python_boilerplate()}
cards = balanced.Card.query.all();

% endif
