<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account.add_card

% else:
${main.python_boilerplate()}
account = balanced.Account.find('${request['uri']}')
account.add_card('${payload['card_uri']}')

% endif
