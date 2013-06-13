<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Hold.capture(...)

% else:
${main.python_boilerplate()}
hold = balanced.Hold.find('${request['hold_uri']}')
debit = hold.capture(
% for k, v in payload.iteritems():
    % if k != 'hold_uri':
    ${k}='${v}',
    % endif
% endfor
)

% endif
