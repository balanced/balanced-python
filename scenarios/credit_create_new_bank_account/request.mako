<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>
<% import json %>
bank_account_info = \
${json.dumps(request['payload']['bank_account'], indent=4)}

credit = balanced.Credit(
    amount=${request['payload']['amount']},
    bank_account=bank_account_info
).save()