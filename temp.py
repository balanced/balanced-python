import glob2
import os
import re

definition_ex = re.compile("% if mode == 'definition':(.*?)% else:")

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
    with open('{}/definition.mako'.format(path_to_write), 'w+') as write_file:
        write_file.write(def_part)



def create_request(path):
    with open(path, 'r') as py_mako:
        content = py_mako.read()
        try:
            def_part = content.split("% if mode == 'definition':")[1] \
                .split('% else:')[0]
        except IndexError:
            def_part = content.split("% if request is not UNDEFINED:")[1] \
                .split('% endif:')[0]
        def_part = def_part.strip()



def run_fix():
    for path in  glob2.glob('./scenarios/**/python.mako'):
        print path
        create_definitions(path)




run_fix()