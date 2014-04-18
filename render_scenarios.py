import glob2
import os
import json
import balanced
import pprint
import requests
import sys

from pprint import PrettyPrinter
from mako.template import Template
from mako.lookup import TemplateLookup

class colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    RESET = '\033[0m'

SCENARIO_CACHE_URL = 'https://raw.githubusercontent.com/balanced/balanced-docs/master/scenario.cache'

def construct_response(scenario_name):
    # load up response data
    data = json.load(open('scenario.cache','r'))
    lookup = TemplateLookup(directories=['./scenarios'])

    for path in glob2.glob('./scenarios/**/request.mako'):
        if path != scenario_name:
            continue
        event_name = path.split('/')[-2]
        template = Template("${response}")
        try:
            response = data[event_name].get('response', {})
            text = template.render(response=response).strip()
            response =  json.loads(text)
            del response["links"]
            for key, value in response.items():
                response = value[0]
                type = key
                resource = balanced.Resource()
                object_type = resource.registry[type]
                object_instance = object_type()
                for key, value in response.items():
                   setattr(object_instance, key, value)
            text = template.render(response=object_instance)
        except KeyError:
            text = ''
    return text

def render_executables():
    # load up scenario data
    data = json.load(open('scenario.cache','r'))
    lookup = TemplateLookup(directories=['./scenarios'])

    for path in glob2.glob('./scenarios/**/request.mako'):
        event_name = path.split('/')[-2]
        template = Template(filename=path, lookup=lookup,)
        try:
            request = data[event_name].get('request', {})
            payload = request.get('payload')
            text = template.render(api_key=data['api_key'],
                                   request=request, payload=payload).strip()
        except KeyError:
            text = ''
            print colors.YELLOW + "WARN: Skipped {} since {} not in scenario.cache".format(
                path, event_name) + colors.RESET
        with open(os.path.join(os.path.dirname(path),
                               'executable.py'), 'w+') as write_to:
            write_to.write(text)

def render_mako():
    for path in glob2.glob('./scenarios/**/request.mako'):
        dir = os.path.dirname(path)
        with open(os.path.join(dir, 'python.mako'), 'w+b') as wfile:
            definition = open(os.path.join(dir, 'definition.mako'),'r').read()
            request = open(os.path.join(dir, 'executable.py'),'r').read()
            response = construct_response(path)
            body = "% if mode == 'definition':\n{}".format(definition) + "\n" \
                   "% elif mode == 'request':\n" + request + "\n" \
                    "% elif mode == 'response':\n" + response + "\n% endif"
            wfile.write(body)

def fetch_scenario_cache():
    try:
        os.remove('scenario.cache')
    except OSError:
        pass

    with open('scenario.cache', 'wb') as fo:
        response = requests.get(SCENARIO_CACHE_URL)
        if not response.ok:
            sys.exit()
        for block in response.iter_content():
            fo.write(block)

if __name__ == "__main__":
    print colors.GREEN + "Obtaining scenario cache..." + colors.RESET
    fetch_scenario_cache()
    print colors.GREEN + "Making Executables..." + colors.RESET
    render_executables()
    print colors.GREEN + "Rendering new mako files..." + colors.RESET
    render_mako()

