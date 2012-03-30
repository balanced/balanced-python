import random
import urllib


def anonymous_create():
    return {
       'uri': '/v1/marketplaces/TEST-M123-456-7890',
       'name': 'Test Marketplace',
       'support_email_address': 'support@example.com',
       'support_phone_number': '+16505551234',
       'domain_url': 'example.com',
       'escrow_balance': 0,
       'account': {
           'uri': ('/v1/marketplaces/TEST-M123-456-7890'
                   '/accounts/A123-456-7890'),
            'api_key': 'd8e7d4406a1e11e193bee4ce8f4a4f46',
            },
        'debits_uri':  '/v1/marketplaces/M123-456-7890/debits',
        'credits_uri':  '/v1/marketplaces/M123-456-7890/credits',
        'refunds_uri':  '/v1/marketplaces/M123-456-7890/refunds',
        'accounts_uri':  '/v1/marketplaces/M123-456-7890/accounts',
        'authorizations_uri':  ('/v1/marketplaces/M123-456-7890/'
                                'authorizations'),
        'api_keys_uri': '/v1/marketplaces/TEST-M123-456-7890/api_keys',
        'meta': {}
    }


def index(limit=10, offset=0, num=1, pages=1):
    params = {
        'limit': limit,
        'offset': offset,
        'num': num,
        }

    pages -= 1
    qs = urllib.urlencode(params.copy())
    params.update({
        'offset': params['limit'] + params['offset'],
        'pages': pages,
        })

    response = {
        'total': num,
        'offset': offset,
        'limit': limit,
        'first_uri': '/v1/marketplaces?' + qs,
        'last_uri':  '/v1/marketplaces?' + qs,
        'next_uri':  None,
        'previous_uri': None,
        'uri': '/v1/marketplaces?' + qs,
    }

    if pages:
        qs_next = urllib.urlencode(params)
        response['next_uri'] = '/v1/marketplaces?' + qs_next

    items = []
    for _ in xrange(num):
        rand = int(random.random() * 10000)
        mp_uri = '/v1/marketplaces/TEST-MP-123-456-{}'.format(rand)
        rand = int(random.random() * 10000)
        ac_uri = mp_uri + '/accounts/AC123-456-{}'.format(rand)

        items.append({
            'uri': mp_uri,
            'name': 'Test Marketplace',
            'support_email_address': 'support@example.com',
            'support_phone_number': '+16505551234',
            'domain_url': 'example.com',
            'escrow_balance': 0,
            'account': {
                'uri': ac_uri,
                'name': 'Test Business',
                'email_address': 'owner@example.com',
                'roles': ['merchant'],
                'balance': 0,
                'debits_uri': ac_uri + '/debits',
                'credits_uri': ac_uri + '/credits',
                'authorizations_uri': 'ac_uri' + '/authorizations',
                'meta': {}
            },
            'debits_uri':  mp_uri + '/debits',
            'credits_uri':  mp_uri + '/credits',
            'refunds_uri':  mp_uri + '/refunds',
            'accounts_uri':  mp_uri + '/accounts',
            'authorizations_uri':  mp_uri + '/authorizations',
            'api_keys_uri': mp_uri + '/api_keys',
            'meta': {}
            })

    response['items'] = items
    return response
