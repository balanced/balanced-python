import os
import threading

from balanced import __version__


def _make_user_agent():
    return 'balanced-python/' + __version__


class Config(threading.local, object):

    def __init__(self):
        super(Config, self).__init__()
        self.api_key_secret = None
        self.api_version = '1'
        self.root_uri = 'https://api.balancedpayments.com'
        # this is requests' config that get passed down on
        # every http operation.
        #
        # see: http://docs.python-requests.org/en/v0.10.4/api/#configurations
        self.requests = {
            'base_headers': {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'User-agent': _make_user_agent(),
                },
                'danger_mode': True,
            }

    @property
    def uri(self):
        return os.path.join(self.root_uri, self.version)

    @property
    def version(self):
        return 'v' + self.api_version
