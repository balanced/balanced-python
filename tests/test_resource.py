from __future__ import unicode_literals

import balanced
from .application import app
from .utils import WSGIServerTest


class TestMarketplaces(WSGIServerTest):

    def setUp(self):
        super(TestMarketplaces, self).setUp()
        balanced.config.root_uri = 'http://localhost:31337'
