import os
import json

FILE_PATH = os.path.dirname(__file__)


def index():
    path = os.path.join(FILE_PATH, 'merchants1.json')
    return json.loads(open(path).read())
