import random
import urllib


def anonymous_create():
    return {
       'uri': '/v1/marketplaces/TEST-M123-456-7890',
       'name': 'Test Marketplace',
       'support_email_address': 'support@example.com',
       'support_phone_number': '+16505551234',
       'domain_url': 'example.com',
       'in_escrow': 0,
       'account': {
           'uri': ('/v1/marketplaces/TEST-M123-456-7890'
                   '/accounts/A123-456-7890'),
            'api_key': 'd8e7d4406a1e11e193bee4ce8f4a4f46',
            },
        'debits_uri':  '/v1/marketplaces/M123-456-7890/debits',
        'credits_uri':  '/v1/marketplaces/M123-456-7890/credits',
        'refunds_uri':  '/v1/marketplaces/M123-456-7890/refunds',
        'accounts_uri':  '/v1/marketplaces/M123-456-7890/accounts',
        'holds_uri':  '/v1/marketplaces/M123-456-7890/holds',
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
        mp_uri = '/v1/marketplaces/TEST-MP-123-456-{0}'.format(rand)
        rand = int(random.random() * 10000)
        ac_uri = mp_uri + '/accounts/AC123-456-{0}'.format(rand)

        items.append({
            'uri': mp_uri,
            'name': 'Test Marketplace',
            'support_email_address': 'support@example.com',
            'support_phone_number': '+16505551234',
            'domain_url': 'example.com',
            'in_escrow': 0,
            'account': {
                'uri': ac_uri,
                'name': 'Test Business',
                'email_address': 'owner@example.com',
                'roles': ['merchant'],
                'balance': 0,
                'debits_uri': ac_uri + '/debits',
                'credits_uri': ac_uri + '/credits',
                'holds_uri': 'ac_uri' + '/holds',
                'meta': {}
            },
            'debits_uri':  mp_uri + '/debits',
            'credits_uri':  mp_uri + '/credits',
            'refunds_uri':  mp_uri + '/refunds',
            'accounts_uri':  mp_uri + '/accounts',
            'holds_uri':  mp_uri + '/holds',
            'api_keys_uri': mp_uri + '/api_keys',
            'meta': {}
            })

    response['items'] = items
    return response
