<%namespace file='/_main.mako' name='main'/>
<% main.python_boilerplate() %>
<% import json %>
merchant_data = \
${json.dumps(request['payload']['merchant'], indent=4)}

account = balanced.Account().save()

try:
    account.add_merchant(merchant_data)
except balanced.exc.MoreInformationRequiredError as ex:
    # could not identify this account.
    print 'redirect merchant to:', ex.redirect_uri
except balanced.exc.HTTPError as error:
    # TODO: handle 400 and 409 exceptions as required
    raise