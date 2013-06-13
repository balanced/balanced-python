<%namespace file='/_main.mako' name='main'/>

% if mode == 'definition':
    balanced.Callback().delete()

% else:
    ${main.python_boilerplate()}
callback = balanced.Callback.find("${request['uri']}")
callback.delete()

% endif
