<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Debit.refund()

% else:
${main.python_boilerplate()}
debit = balanced.Debit.find('${request['debit_uri']}')
debit.refund(
    description='${payload['description']}',
    meta={
    % for k, v in payload['meta'].iteritems():
        '${k}': '${v}',
    % endfor
    },
)

% endif
