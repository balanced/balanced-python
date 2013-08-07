${main.python_boilerplate()}
hold = balanced.Hold.find('${request['uri']}')
hold.void()