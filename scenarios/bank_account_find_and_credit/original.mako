<%namespace file='/_main.mako' name='main'/>

% if request is not UNDEFINED:
${main.python_boilerplate()}
bank_account = balanced.BankAccount.find("${request['uri']}")
bank_account.credit(${request['amount']})

% endif
