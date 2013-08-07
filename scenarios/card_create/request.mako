${main.python_boilerplate()}
card = balanced.Card(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
).save()