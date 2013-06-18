"""
Balanced Python client library.

See ``README.md`` for usage advice.
"""
import os
import pickle
import re
import subprocess
from distutils.core import Command

try:
    import setuptools
except ImportError:
    import distutils.core

    setup = distutils.core.setup
else:
    setup = setuptools.setup


class DocumentationCommand(Command):
    description = 'build documentation and upload to s3'
    path_to_pickled_file = 'docs/build/pickle/api_reference.fpickle'
    destination_file = 'docs/build/python_api_reference.html'
    user_options = []

    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        self._build_docs()
        self._upload_to_s3(self._unpickle(),
                           'justice.web',
                           'docs/python_api_reference.html')

    def _build_docs(self):
        p = subprocess.Popen('make clean'.split(), cwd='docs')
        p.wait()
        p = subprocess.Popen('make pickle'.split(), cwd='docs')
        p.wait()

    def _unpickle(self):
        with open(self.path_to_pickled_file) as f:
            pickled = f.read()
        unpickled = pickle.loads(pickled)
        return unpickled['body']

    def _upload_to_s3(self, data, bucket, key_name):
        from boto.s3.connection import S3Connection
        from boto.s3.key import Key

        conn = S3Connection()
        bucket = conn.get_bucket(bucket)

        key = Key(bucket)
        key.key = key_name
        key.set_contents_from_string(data)
        key.set_acl('public-read')


def _get_version():
    path = os.path.join(PATH_TO_FILE, 'balanced', '__init__.py')
    version_re = r".*__version__ = '(.*?)'"
    fo = open(path)
    try:
        return re.compile(version_re, re.S).match(fo.read()).group(1)
    finally:
        fo.close()


def _get_long_description():
    path = os.path.join(PATH_TO_FILE, 'README.md')
    fo = open(path)
    try:
        return fo.read()
    finally:
        fo.close()


def parse_requirements(file_name):
    requirements = []
    for line in open(file_name, 'r').read().split('\n'):
        if re.match(r'(\s*#)|(\s*$)', line):
            continue
        if re.match(r'\s*-e\s+', line):
            requirements.append(re.sub(r'\s*-e\s+.*#egg=(.*)$', r'\1', line))
        elif re.match(r'\s*-f\s+', line):
            pass
        else:
            requirements.append(line)

    return requirements


def parse_dependency_links(file_name):
    dependency_links = []
    for line in open(file_name, 'r').read().split('\n'):
        if re.match(r'\s*-[ef]\s+', line):
            dependency_links.append(re.sub(r'\s*-[ef]\s+', '', line))

    return dependency_links

PATH_TO_FILE = os.path.dirname(__file__)
VERSION = _get_version()
LONG_DESCRIPTION = _get_long_description()

setup(
    name='balanced',
    version=VERSION,
    url='https://balancedpayments.com/',
    license='BSD',
    author='Mahmoud Abdelkader',
    author_email='support@balancedpayments.com',
    description='Payments platform for marketplaces',
    long_description=LONG_DESCRIPTION,
    packages=['balanced'],
    test_suite='nose.collector',
    install_requires=parse_requirements('requirements.txt'),
    dependency_links=parse_dependency_links('requirements.txt'),
    classifiers=[
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Programming Language :: Python',
        'Topic :: Software Development :: Libraries :: Python Modules',
    ],
    cmdclass={
        'docs': DocumentationCommand,
    }
)
