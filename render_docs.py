import glob2
import os
import json
from mako.template import Template
from mako.lookup import TemplateLookup

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
            top = open(os.path.join(dir, 'definition.mako'),'r').read()
            bottom = open(os.path.join(dir, 'executable.py'),'r').read()
            body = "% if mode == 'definition':\n{}".format(top) + "\n% " \
                                                                    "else:\n" + bottom + "\n% endif"
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

