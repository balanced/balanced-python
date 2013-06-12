${main.python_boilerplate()}
bank_account = balanced.BankAccount.find('${request['bank_account_uri']}')
verification = bank_account.verification
    % for k, v in payload.iteritems():
verification.${k} = ${v}
    % endfor
verification.save