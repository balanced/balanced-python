<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.BankAccount.find
% else:
${main.python_boilerplate()}
bank_account = balanced.BankAccount.find("${request['uri']}")
% endif
