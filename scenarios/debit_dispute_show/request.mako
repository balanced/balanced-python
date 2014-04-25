<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>

debit = balanced.Debit.fetch('${request['debit_href']}')
dispute = debit.dispute