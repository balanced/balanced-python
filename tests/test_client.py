from __future__ import unicode_literals

import balanced

from . import utils


class TestClient(utils.TestCase):

    def setUp(self):
        super(TestClient, self).setUp()

    def test_configure(self):
        expected_headers = {
            'content-type': 'application/json;revision=1.1',
            'accept': 'application/vnd.api+json;revision=1.1',
            'User-Agent': u'balanced-python/' + balanced.__version__,
        }
        self.assertDictContainsSubset(
            expected_headers, balanced.config.client.config.headers
        )
