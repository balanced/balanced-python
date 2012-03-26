import unittest

import mock

from poundpay.resource import Resource


class TestResource(unittest.TestCase):

    def test_resource_constructor_updates__dict__(self):
        resource_args = {'sid': 1, 'blah': 2}
        resource = Resource(**resource_args)
        self.assertEqual(resource.sid, 1)
        self.assertEqual(resource.blah, 2)
        self.assertEqual(resource.__dict__, resource_args)

    def test_repr(self):
        resource_args = {'sid': 1}
        resource = Resource(**resource_args)
        self.assertEqual('Resource(sid=1)', '%r' % resource)

    def test_all(self):
        resource = {'name': [{'sid': 1}]}
        mock_client = mock.Mock()

        mock_response = mock.Mock()
        mock_response.json = resource

        mock_client.get.return_value = mock_response

        Resource.client = mock_client
        Resource._name = 'name'
        resources = Resource.all()
        self.assertTrue(isinstance(resources, list))
        self.assertTrue(isinstance(resources[0], Resource))
        self.assertEqual(resources[0].sid, 1)
        mock_client.get.assert_called_once_with('name')

    def test_find(self):
        resource = {'sid': 1}
        mock_client = mock.Mock()

        mock_response = mock.Mock()
        mock_response.json = resource

        mock_client.get.return_value = mock_response

        Resource.client = mock_client
        Resource._name = 'name'
        fetched_resource = Resource.find('SID')
        self.assertEqual(fetched_resource.sid, resource['sid'])
        mock_client.get.assert_called_once_with('name/SID')

    def test_save_when_payment_has_no_sid_issues_POST(self):
        Resource._name = 'name'
        resource_args = {'blah': 1}
        mock_client = mock.Mock()
        Resource.client = mock_client

        mock_response = mock.Mock()
        returned = resource_args.copy()
        returned['sid'] = 1
        mock_response.json = returned

        mock_client.post.return_value = mock_response
        fetched_resource = Resource(**resource_args).save()
        self.assertEqual(fetched_resource.sid, returned['sid'])
        mock_client.post.assert_called_once_with('name', resource_args)

    def test_save_when_payment_has_an_sid_issues_PUT(self):
        Resource._name = 'name'
        resource_args = {'sid': 1, 'blah': 1}
        mock_client = mock.Mock()
        Resource.client = mock_client

        mock_response = mock.Mock()
        mock_response.json = resource_args

        mock_client.put.return_value = mock_response
        fetched_resource = Resource(**resource_args).save()
        self.assertEqual(fetched_resource.sid, resource_args['sid'])
        # we do this dance because _update() has a kwarg of a sid.
        kwargs = resource_args.copy()
        del kwargs['sid']
        mock_client.put.assert_called_once_with('name/1', kwargs)

    def test_delete(self):
        resource_args = {'sid': 1}
        resource = Resource(**resource_args)
        resource._name = 'name'

        mock_client = mock.Mock()
        resource.client = mock_client

        mock_client.delete.return_value = mock.sentinel

        response = resource.delete()
        self.assertIsNone(response)
        mock_client.delete.assert_called_once_with('name/1')

    def test_get_path(self):
        Resource._name = 'blah'
        resource = Resource()
        self.assertEqual(resource._get_path('sid'), 'blah/sid')
