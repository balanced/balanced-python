<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.BankAccount.query()

% else:
${main.python_boilerplate()}
bank_accounts = balanced.BankAccount.query.all()

% endif
