from __future__ import unicode_literals
import datetime

import balanced
from .application import app
from .utils import WSGIServerTest


class TestResourceConstruction(WSGIServerTest):

    def setUp(self):
        super(TestResourceConstruction, self).setUp()
        balanced.config.root_uri = 'http://localhost:31337'

    def test_property_conversion_from_uri_task_3833(self):
        with self.start_server(app):
            txns = [
                t for t in balanced.Transaction.query
                if 'TEST-MP778-071-6386/debits/W985-622-9570' in t.uri]
            self.assertEqual(txns[0].account_uri, txns[0].account.uri)

    def test_implicit_conversion_to_datetime(self):
        with self.start_server(app):
            for txn in balanced.Transaction.query:
                if isinstance(txn, balanced.Debit):
                    break
            self.assertIsInstance(txn.created_at, datetime.datetime)
