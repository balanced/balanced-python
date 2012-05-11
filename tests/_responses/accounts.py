

def show(marketplace_eid, account_eid):
    mp_uri = '/v1/marketplaces/' + marketplace_eid
    ac_uri = mp_uri + '/accounts/' + account_eid

    return {
        'transactions_uri': ac_uri + '/transactions',
        'name': 'Nicolaas Bloembergen',
        'roles': [
            'buyer'
        ],
        'created_at': '2012-03-27T11:11:34.104277Z',
        'holds_uri':  ac_uri + '/holds',
        'uri': ac_uri,
        'refunds_uri': ac_uri + '/refunds',
        'meta': {},
        'debits_uri': ac_uri + '/debits',
        'email_address': 'nicolaas.bloembergen214@hotmail.web',
        'credits_uri': ac_uri + '/credits'
    }
