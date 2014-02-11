import glob2
import os
import json
import balanced
import pprint
from pprint import PrettyPrinter
from mako.template import Template
from mako.lookup import TemplateLookup

def pretty_print_response(response):
    template = Template("${response}")
    dictionary_text = pprint.pformat(response.__dict__)
    text = template.render(response=response)
    text = text.split('(', 1)[0] + "(" + dictionary_text + ")"
    text = text.replace('({', '(**{\n ')
    text = text.replace('})', '\n})')
    return text

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
            text = pretty_print_response(object_instance)
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
            print "WARN: Skipped {} since {} not in scenario.cache".format(
                path, event_name)
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

def issue_no_mako_warnings():

    set_has_mako = set([])
    set_no_python_mako = set([])
    for path in glob2.glob('./scenarios/**/*.mako'):
        set_has_mako.add(os.path.dirname(path))
    for path in glob2.glob('./scenarios/**/python.mako'):
        set_no_python_mako.add(os.path.dirname(path))
    print 'The following dont have a python.mako file. Look into it!'
    print set_has_mako.difference(set_no_python_mako)



if __name__ == "__main__":
    print "Making Executables"
    render_executables()
    print "Rendering new mako files"
    render_mako()
    issue_no_mako_warnings()

