<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.exc.HTTPError

% else:
${main.python_boilerplate()}
bank_account = balanced.BankAccount(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)

try:
    bank_account.save()
except balanced.exc.HTTPError, ex:
    assert ex.status_code == 400
    assert 'Routing number is invalid' in ex.description
    assert ex.request_id is not None

% endif
