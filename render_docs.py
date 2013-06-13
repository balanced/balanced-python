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
            print "WARNING {} skipped".format(path)
            def_part =  ''
        def_part = def_part.strip()
    path_to_write = os.path.dirname(path)
    with open(os.path.join(path_to_write, 'definition.mako'),
              'w+') as write_file:
        write_file.write(def_part)
    return def_part



def create_request(path):
    with open(path, 'r') as py_mako:
        content = py_mako.read()
        try:
            request_part = content.split("% else:")[1] \
                .split('% endif')[0]
        except IndexError:
            print "WARNING {} skipped".format(path)
            request_part =  ''
        request_part = request_part.strip()
    path_to_write = os.path.dirname(path)
    with open(os.path.join(path_to_write, 'request.mako'),'w+') as write_file:
        write_file.write(request_part)
    return request_part



def run_fix():
    for path in glob2.glob('./scenarios/**/python.mako'):
        def_part = create_definitions(path)
        req_part = create_request(path)
        os.rename(path, os.path.join(os.path.dirname(path), 'original.mako'))


def fix_main_mako():
    with open('./scenarios/_main.mako', 'r') as file_name:
        data = file_name.read()
        new_data= data.replace('ctx.', '')
    with open('./scenarios/_main.mako', 'w+b') as file_name:
        file_name.write(new_data)



def render_exec():
    data = json.load(open('scenario.cache','r'))
    lookup = TemplateLookup(directories=['./scenarios'])
    for path in glob2.glob('./scenarios/**/original.mako'):
        event_name = path.split('/')[-2]
        template = Template(filename=path, lookup=lookup,)
        try:
            request = data[event_name].get('request', {})
            payload = request.get('payload')
            text = template.render(api_key=data['api_key'],
                                  request=request, payload=payload).strip()
            with open(os.path.join(os.path.dirname(path),
                                   '{}.py'.format(event_name)),
                                   'w+'
                      ) as write_to:
                write_to.write(text)
        except KeyError:
            print "WARN: Skipped {} since {} not in scenario.cache".format(
                path, event_name)

def render_rest():
    for path in glob2.glob('./scenarios/**/*.py'):
        dir = os.path.dirname(path)
        with open(os.path.join(dir, 'python.mako'), 'w+b') as wfile:
            top = open(os.path.join(dir, 'definition.mako'),'r').read()
            bottom = open(path).read()
            body = "% if mode == 'definition':\n\n{}".format(top) + "\n% " \
                            "else:\n" + bottom + "\n\n% endif"
            wfile.write(body)





if __name__ == "__main__":
    print "Setting up"
    delete_by_file_type('curl.mako')
    delete_by_file_type('__init__.py')
    delete_by_file_type('metadata.py')
    delete_by_file_type('php.mako')
    delete_by_file_type('ruby.mako')
    fix_main_mako()
    print "Fixing"
    run_fix()
    print "Making Executables"
    render_exec()
    print "Rendering new mako files"
    render_rest()


