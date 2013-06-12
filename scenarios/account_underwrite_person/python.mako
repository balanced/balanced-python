<%namespace file='/_main.mako' name='main'/>
% if mode == 'definition':
balanced.Marketplace.create_merchant()

% else:
${main.python_boilerplate()}
merchant_data = {
% for k, v in payload['merchant'].iteritems():
    '${k}': '${v}',
% endfor
}


account = balanced.Account().save()

try:
    account.add_merchant(merchant_data)
except balanced.exc.MoreInformationRequiredError as ex:
    # could not identify this account.
    print 'redirect merchant to:', ex.redirect_uri
except balanced.exc.HTTPError as error:
    # TODO: handle 400 and 409 exceptions as required
    raise

% endif
