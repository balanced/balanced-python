import os
import json

FILE_PATH = os.path.dirname(__file__)


def index(limit=10, offset=0):
    if not offset:
        path = os.path.join(FILE_PATH, 'transactions1.json')
        return json.loads(open(path).read())
    else:
        path = os.path.join(FILE_PATH, 'transactions2.json')
        return json.loads(open(path).read())
