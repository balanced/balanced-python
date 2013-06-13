% if mode == 'definition':

balanced.Marketplace.create_merchant()
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


merchant_data = {
    'phone_number': '+140899188155',
    'name': 'Skripts4Kids',
    'postal_code': '91111',
    'type': 'business',
    'street_address': '555 VoidMain Road',
    'tax_id': '211111111',
    'person': {
        'dob': '1989-12',
        'phone_number': '+14089999999',
        'postal_code': '94110',
        'name': 'Timmy Q. CopyPasta',
        'street_address': '121 Skriptkid Row',
    },
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