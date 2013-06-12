<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.BankAccount.save()

% else:
${main.python_boilerplate()}
bank_account = balanced.BankAccount(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
).save()

% endif
