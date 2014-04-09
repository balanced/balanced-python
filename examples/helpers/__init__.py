
import simplejson as json

import requests


class RequestBinClient(object):
    base_url = 'http://requestb.in/api/v1'
    create_url = base_url + '/bins'

    def __init__(self):
        response = requests.post(self.create_url)
        self.bin = json.loads(response.text)

    def get_requests(self):
        response = requests.get(
            self.create_url + '/{}/requests'.format(self.bin['name'])
        )
        return json.loads(response.text)

    @property
    def callback_url(self):
        return 'http://requestb.in/{}'.format(self.bin['name'])

    @property
    def view_url(self):
        return self.callback_url + '?inspect'

    def __str__(self):
        return str(self.bin)
