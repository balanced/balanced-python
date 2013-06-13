import glob2
import os
import json
from mako.template import Template
from mako.lookup import TemplateLookup


def delete_by_file_type(file_type):
    for each in glob2.glob('./scenarios/**/{}'.format(file_type)):
        os.remove(each)


def create_definitions(path):
    with open(path, 'r') as py_mako:
        content = py_mako.read()
        try:
            def_part = content.split("% if mode == 'definition':")[1] \
                .split('% else:')[0]
        except IndexError:
            def_part = content.split("% if request is not UNDEFINED:")[1] \
                .split('% endif:')[0]
        def_part = def_part.strip()
    path_to_write = os.path.dirname(path)
    with open(os.path.join(path_to_write, 'definition.mako'),
              'w+') as write_file:
        write_file.write(def_part)



def create_request(path):
    with open(path, 'r') as py_mako:
        content = py_mako.read()
        try:
            request_part = content.split("% else:")[1] \
                .split('% endif')[0]
        except IndexError:
            request_part = content.split("% if request is not UNDEFINED:")[1] \
                .split('% endif')[0]
        request_part = request_part.strip()
    path_to_write = os.path.dirname(path)
    with open(os.path.join(path_to_write, 'request.mako'),'w+') as write_file:
        write_file.write(request_part)



def run_fix():
    for path in  glob2.glob('./scenarios/**/python.original.mako'):
        create_definitions(path)
        create_request(path)

def render_mako():
    data = json.load(open('scenario.cache','r'))
    lookup = TemplateLookup(directories=['./scenarios'])
    for path in glob2.glob('./scenarios/**/python.original.mako'):
        event_name = path.split('/')[-2]
        template = Template(filename=path, lookup=lookup,)
        try:
            request = data[event_name].get('request', {})
            payload = request.get('payload')
            text = template.render(api_key=data['api_key'],
                                  request=request, payload=payload).strip()
            with open(os.path.join(os.path.dirname(path), 'python.py'), 'w+'
                      ) as write_to:
                write_to.write(text)
        except KeyError:
            print "WARN: Skipped {} since {} not in scenario.cache".format(
                path, event_name)




if __name__ == "__main__":
    run_fix()
    render_mako()
