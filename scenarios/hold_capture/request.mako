${main.python_boilerplate()}
hold = balanced.Hold.find('${request['hold_uri']}')
debit = hold.capture(
% for k, v in payload.iteritems():
    % if k != 'hold_uri':
    ${k}='${v}',