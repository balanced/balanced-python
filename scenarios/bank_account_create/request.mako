${main.python_boilerplate()}
bank_account = balanced.BankAccount(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
).save()