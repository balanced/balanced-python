<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Card.save()

% else:
${main.python_boilerplate()}
card = balanced.Card(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
).save()

% endif
