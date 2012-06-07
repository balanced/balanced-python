# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import unittest

import balanced


class AcceptanceUseCases(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        balanced.config.root_uri = 'http://127.0.0.1:5000/'
        if not balanced.config.api_key_secret:
            api_key = balanced.APIKey().save()
            balanced.configure(api_key.secret)
            cls.api_key = api_key
            cls.merchant = api_key.merchant
            balanced.Marketplace().save()


    def test_00_merchant_expectations(self):
        mps = balanced.Marketplace.query.all()
        self.assertEqual(len(mps), 1)
