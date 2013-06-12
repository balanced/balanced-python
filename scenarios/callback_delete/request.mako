${main.python_boilerplate()}
callback = balanced.Callback.find("${request['uri']}")
callback.delete()