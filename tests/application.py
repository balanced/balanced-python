import json

import bottle

import _responses


SERIALIZERS = {
    'application/json': json.dumps,
    }


app = bottle.Bottle()


@app.get('/marketplaces/<mp_eid>/accounts/<ac_eid>')
def marketplace_accounts(mp_eid, ac_eid):
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    serializer = SERIALIZERS[bottle.response.content_type]
    the_response = _responses.accounts.show(mp_eid, ac_eid)
    bottle.response.body = serializer(the_response)
    return bottle.response


@app.get('/merchants')
def merchants_index():
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    serializer = SERIALIZERS[bottle.response.content_type]
    the_response = _responses.merchants.index()
    bottle.response.body = serializer(the_response)
    return bottle.response


@app.get('/marketplaces')
def marketplaces_index():
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    serializer = SERIALIZERS[bottle.response.content_type]
    limit = int(bottle.request.query.limit or 10)
    offset = int(bottle.request.query.offset or 0)
    num = int(bottle.request.query.num or 1)
    pages = int(bottle.request.query.pages or 1)
    the_response = _responses.marketplaces.index(limit, offset, num, pages)
    bottle.response.body = serializer(the_response)
    return bottle.response


@app.post('/marketplaces')
def marketplaces_create():
    bottle.response.status = 201
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    serializer = SERIALIZERS[bottle.response.content_type]
    if not bottle.request.auth:
        the_response = _responses.marketplaces.anonymous_create()
    else:
        the_response = _responses.marketplaces.anonymous_create()

    bottle.response.body = serializer(the_response)
    return bottle.response


@app.put('/marketplaces/<_eid>')
def marketplaces_put(_eid):
    return marketplaces_create()


@app.post('/api_keys')
def api_keys():
    bottle.response.status = 302
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    bottle.response.set_header('Location', '/v1/your-mom')
    bottle.response.body = json.dumps('')
    return bottle.response


@app.get('/marketplaces/<_eid>/transactions')
def marketplaces_transactions(_eid):
    bottle.response.content_type = (
        bottle.request.headers.get('Accept', 'application/json'))
    serializer = SERIALIZERS[bottle.response.content_type]
    limit = int(bottle.request.query.limit or 10)
    offset = int(bottle.request.query.offset or 0)
    the_response = _responses.transactions.index(limit, offset)
    bottle.response.body = serializer(the_response)
    return bottle.response


app.mount('/v1', app)
