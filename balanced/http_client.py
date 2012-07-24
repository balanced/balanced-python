import json
import os
import threading

import requests
from requests.models import REDIRECT_STATI

from balanced.config import Config
from balanced.utils import to_json
from balanced.exc import HTTPError, BalancedError, MoreInformationRequiredError

serializers = {
    'application/json': to_json
    }


deserializers = {
    'application/json': json.loads
    }


REDIRECT_STATI = list(REDIRECT_STATI)
REDIRECT_STATI.append(300)


def wrap_raise_for_status(http_client):

    def wrapper(response_instance):

        raise_for_status = response_instance.raise_for_status

        def wrapped():
            try:
                raise_for_status(allow_redirects=False)
            except requests.HTTPError, exc:
                if exc.response.status_code in REDIRECT_STATI:
                    redirection = MoreInformationRequiredError('%s' % exc)
                    redirection.status_code = exc.response.status_code
                    redirection.response = exc.response
                    redirection.redirect_uri = exc.response.headers['Location']
                    raise redirection
                deserialized = http_client.deserialize(
                    response_instance
                    )
                response_instance.deserialized = deserialized
                extra = deserialized.get('additional') or ''
                if extra:
                    extra = ' -- {}.'.format(extra)
                error_msg = '{name}: {code}: {msg} {extra}'.format(
                        name=deserialized['status'],
                        code=deserialized['status_code'],
                        msg=deserialized['description'].encode('utf8'),
                        extra=extra.encode('utf8'),
                    )
                http_error = HTTPError(error_msg)
                for error, value in response_instance.deserialized.iteritems():
                    setattr(http_error, error, value)
                raise http_error

        response_instance.raise_for_status = wrapped

    return wrapper


def munge_request(http_op):

    # follows the spec for requests.<http operation>
    def transform_into_absolute_url(config, url):
        if url.startswith(config.uri):
            return url
        url = url.lstrip('/')
        if url.startswith(config.version):
            url = os.path.join(config.root_uri, url)
        else:
            url = os.path.join(config.uri, url)
        return url

    def prepend_version(config, url):
        url = url.lstrip('/')
        if not url.startswith(config.version):
            url = os.path.join(config.version, url)
        return url

    def make_absolute_url(client, url, **kwargs):
        url = transform_into_absolute_url(client.config, url)
        request_body = kwargs.get('data', {})
        fixed_up_body = {}
        for key, value in request_body.iteritems():
            if key.endswith('_uri') and value:
                fixed_up_body[key] = prepend_version(client.config, value)
        request_body.update(fixed_up_body)
        kwargs['data'] = request_body
        # TODO: merge config dictionaries if it exists.
        kwargs['config'] = client.config.requests.copy()
        kwargs['allow_redirects'] = False
        kwargs['hooks'] = {
            'response': wrap_raise_for_status(client)
            }

        if client.config.api_key_secret:
            kwargs['auth'] = (client.config.api_key_secret, None)

        return http_op(client, url, **kwargs)

    return make_absolute_url


class HTTPClient(threading.local, object):

    config = Config()

    def __init__(self, keep_alive=True, *args, **kwargs):
        super(HTTPClient, self).__init__(*args, **kwargs)
        self.interface = requests.session() if keep_alive else requests

    # we don't use the requests hook here because we want to expose
    # that for any developer to access it directly.
    #
    # maybe eventually we should include requests configuration in the
    # config?
    @munge_request
    def get(self, uri, **kwargs):
        kwargs = self.serialize(kwargs.copy())
        resp = self.interface.get(uri, **kwargs)
        if kwargs.get('return_response', True):
            resp.deserialized = self.deserialize(resp)
        return resp

    @munge_request
    def post(self, uri, data=None, **kwargs):
        data = self.serialize({'data': data}).pop('data')
        resp = self.interface.post(uri, data=data, **kwargs)
        if kwargs.get('return_response', True):
            resp.deserialized = self.deserialize(resp)
        return resp

    @munge_request
    def put(self, uri, data=None, **kwargs):
        data = self.serialize({'data': data}).pop('data')
        resp = self.interface.put(uri, data=data, **kwargs)
        if kwargs.get('return_response', True):
            resp.deserialized = self.deserialize(resp)
        return resp

    @munge_request
    def delete(self, uri, **kwargs):
        kwargs = self.serialize(kwargs.copy())
        resp = self.interface.delete(uri, **kwargs)
        if kwargs.get('return_response', True):
            resp.deserialized = self.deserialize(resp)
        return resp

    def deserialize(self, resp):
        try:
            return deserializers[resp.headers['Content-Type']](resp.content)
        except KeyError:
            raise BalancedError('Invalid content type "{}": {}'.format(
                resp.headers['Content-Type'], resp.content,
            ))

    def serialize(self, kwargs):
        content_type = self.config.requests['base_headers']['Content-Type']
        data = kwargs.pop('data', None)
        kwargs['data'] = serializers[content_type](data) if data else data
        return kwargs
