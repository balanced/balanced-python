from __future__ import unicode_literals
import os

import simplejson as json


class ResourceMeta(type):

    def __getattr__(cls, item):
        return json.load(open(os.path.join(
            os.path.dirname(os.path.abspath(__file__)),
            'resources/{0}.json'.format(item))
        ))


class Resources(object):
    __metaclass__ = ResourceMeta
