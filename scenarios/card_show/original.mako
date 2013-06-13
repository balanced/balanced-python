<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Card.find

% else:
${main.python_boilerplate()}
card = balanced.Card.find("${request['uri']}")

% endif
