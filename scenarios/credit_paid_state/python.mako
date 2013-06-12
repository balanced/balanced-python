<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Credit.save()

% else:
${main.python_boilerplate()}
bank_account_info = dict(
% for k, v in request['bank_account'].iteritems():
    ${k}='${v}',
% endfor
)
credit = balanced.Credit(
    amount=${request['amount']},
    bank_account=bank_account_info
).save()

% endif
