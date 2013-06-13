<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Account(...).save()

% else:
${main.python_boilerplate()}
buyer = balanced.Marketplace.my_marketplace.create_buyer(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)

% endif
