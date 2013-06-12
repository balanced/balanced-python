<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Customer(...).save()

% else:
${main.python_boilerplate()}
customer = balanced.Customer().save()

% endif
