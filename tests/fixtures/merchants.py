PERSON_MERCHANT = {
    'type': 'person',
    'name': 'William James',
    'tax_id': '393-48-3992',              # Should work w/ and w/o dashes
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'dob': '1842-01-01',
    'phone_number': '+16505551234',
    'country_code': 'USA',
}

BUSINESS_PRINCIPAL = {
    'name': 'William James',
    'tax_id': '393483992',
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'dob': '1842-01-01',
    'phone_number': '+16505551234',
    'country_code': 'USA',
}

BUSINESS_MERCHANT = {
    'type': 'business',
    'name': 'Levain Bakery',
    'tax_id': '253912384',
    'street_address': '167 West 74th Street',
    'postal_code': '10023',
    'phone_number': '+16505551234',
    'country_code': 'USA',
    'person': BUSINESS_PRINCIPAL,
}
