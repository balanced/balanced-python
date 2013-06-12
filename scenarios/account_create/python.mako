<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account(...).save()

% else:
${main.python_boilerplate()}
account = balanced.Account().save()

% endif
