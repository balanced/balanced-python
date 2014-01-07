<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

credit = balanced.Credit.find('${request['credit_href']}')
reversal = credit.reverse()