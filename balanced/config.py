from __future__ import unicode_literals
from datetime import datetime

import simplejson as json
from iso8601 import iso8601
import wac

from balanced import exc
from . import __version__


API_ROOT = 'https://api.balancedpayments.com'


# config
def configure(
        user=None,
        root_url=API_ROOT,
        api_revision='1.1',
        user_agent='balanced-python/' + __version__,
        accept_type='application/vnd.api+json',
        **kwargs
):
    kwargs.setdefault('headers', {})

    for key, value in (
        ('content-type', 'application/json;revision=' + api_revision),
        ('accept', '{0};revision={1}'.format(accept_type, api_revision))
    ):
        kwargs['headers'].setdefault(key, value)

    if 'error_cls' not in kwargs:
        kwargs['error_cls'] = exc.convert_error

    if user:
        kwargs['auth'] = (user, None)

    # apply
    Client.config = Config(root_url, user_agent=user_agent, **kwargs)


class Config(wac.Config):

    api_revision = None

    user_agent = None


default_config = Config(API_ROOT)


# client

class Client(wac.Client):

    config = default_config

    @staticmethod
    def _default_serialize(o):
        if isinstance(o, datetime):
            return o.isoformat() + 'Z'
        raise TypeError(
            'Object of type {} with value of {} is not '
            'JSON serializable'.format(type(o), repr(o))
        )

    def _serialize(self, data):
        data = json.dumps(data, default=self._default_serialize)
        return 'application/json', data

    @staticmethod
    def _parse_deserialized(e):
        if isinstance(e, dict):
            for k in e.iterkeys():
                if k.endswith('_at') and isinstance(e[k], basestring):
                    e[k] = iso8601.parse_date(e[k])
        return e

    def _deserialize(self, response):
        if response.headers['Content-Type'] != 'application/json':
            raise Exception("Unsupported content-type '{}'".format(
                response.headers['Content-Type']
            ))
        if not response.content:
            return None
        data = json.loads(response.content)
        return self._parse_deserialized(data)


configure()

client = Client()
