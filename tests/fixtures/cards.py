# -*- coding: utf-8 -*-
from __future__ import unicode_literals


TEST_CARDS = {
    'visa': [
        '4112344112344113',
        '4110144110144115',
        '4114360123456785',
        '4061724061724061',
    ],
    'mastercard': [
        '5111005111051128',
        '5112345112345114',
        '5115915115915118',
        '5116601234567894',
    ],
    'amex': [
        '371144371144376',
        '341134113411347',
    ],
    'discover': [
        '6011016011016011',
        '6559906559906557',
    ]
}


def generate_international_card_payloads():
    cards = [
        {
            'street_address': '田原３ー８ー１',
            'city': '都留市',
            'region': '山梨県',
            'postal_code': '4020054',
            'country_code': 'JPN',
            'name': '徳川家康',
            'card_number': '4' + '1' * 15,
            'expiration_month': 12,
            'expiration_year': 2014,
        },
        {
            'street_address': 'Malmö högskola',
            'city': 'Malmö',
            'region': '',
            'postal_code': '205 06',
            'country_code': 'SWE',
            'name': 'Dolph Lundgren',
            'card_number': '4' + '1' * 15,
            'expiration_month': 12,
            'expiration_year': 2014,
        },
    ]

    for card in cards:
        yield card
