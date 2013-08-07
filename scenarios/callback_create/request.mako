${main.python_boilerplate()}
    callback = balanced.Callback(
    % for k, v in payload.iteritems():
        ${k}='${v}',
    % endfor
    ).save()