

import balanced

from . import fixtures, utils


class TestResourceConstruction(utils.TestCase):

    def setUp(self):
        super(TestResourceConstruction, self).setUp()

    def test_load_resource(self):
        resp = fixtures.Resources.marketplaces
        marketplace = balanced.Marketplace(**resp)
        self.assertIsNotNone(marketplace.debits)
