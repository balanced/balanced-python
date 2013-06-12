<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Credit.find()

% else:
${main.python_boilerplate()}
credit = balanced.Credit.find('${request['uri']}')

% endif
