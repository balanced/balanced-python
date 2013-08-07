from __future__ import unicode_literals
import json
import os

import glob2
from mako.template import Template
from mako.lookup import TemplateLookup
from mako.exceptions import SyntaxException

def render_docs():
    """
    Processes request.mako and definiton.mako to create a semi-static
    python.mako
    """
    data = json.load(open('scenario.cache', 'r'))
    lookup = TemplateLookup(directories=['./scenarios'])
    for directory in glob2.glob('./scenarios/**/'):
        try:
            with open(os.path.join(directory, 'definition.mako'), 'r') as definition_file:
                definition_body = definition_file.read()
            with open(os.path.join(directory, 'request.mako'), 'r') as request_file:
                request_body = request_file.read()
        except IOError:
            print "WARNING: {} doesnt have both request and definition".format(
                directory)
            continue
        event_name = directory.split('/')[-2]
        try:
            request_body_fixed = "<%namespace file='/_main.mako' name='main'/>\n" + request_body
            request = data[event_name].get('request', {})
            payload = request.get('payload')
            template = Template(text=request_body_fixed, lookup=lookup)
            request_rendered = template.render(
                api_key=data['api_key'], request=request,
                payload=payload).strip()
        except KeyError:
            print "WARN: Skipped {} since {} not in scenario.cache".format(
                            directory, event_name)
            continue
        except SyntaxException:
            print "Mako syntax exception on {}".format(directory)
            continue


        with open(os.path.join(directory, 'python.mako'), 'w+b') as wfile:
            request_rendered.replace("<%namespace file='/_main.mako' name='main'/>\n", '')
            full_body = "% if mode == 'definition':\n\n{}\n% else:\n{}\n\n% endif".format(definition_body, request_rendered)
            wfile.write(full_body)
            print "{} done!".format(directory)


if __name__ == "__main__":
    print "Rendering docs:"
    render_docs()
    print "DONE!"
