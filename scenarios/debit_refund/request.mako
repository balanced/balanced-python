<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

debit = balanced.Debit.find('${request['debit_uri']}')
debit.refund()