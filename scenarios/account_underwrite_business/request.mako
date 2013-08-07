${main.python_boilerplate()}
merchant_data = {
% for k, v in payload['merchant'].iteritems():
    % if k != 'person':
    '${k}': '${v}',