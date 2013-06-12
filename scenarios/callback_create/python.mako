<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
    balanced.Callback().save()

% else:
    ${main.python_boilerplate()}
    callback = balanced.Callback(
    % for k, v in payload.iteritems():
        ${k}='${v}',
    % endfor
    ).save()

% endif
