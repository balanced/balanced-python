<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Hold.find

% else:
${main.python_boilerplate()}
hold = balanced.Hold.find("${request['uri']}")

% endif
