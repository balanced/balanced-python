"""
Balanced Python client library.

See ``README.rst`` for usage advice.
"""
import os
import re

try:
    import setuptools
except ImportError:
    import distutils.core
    setup = distutils.core.setup
else:
    setup = setuptools.setup


def _get_version():
    path = os.path.join(PATH_TO_FILE, 'balanced', '__init__.py')
    version_re = r".*__version__ = '(.*?)'"
    fo = open(path)
    try:
        return re.compile(version_re, re.S).match(fo.read()).group(1)
    finally:
        fo.close()


def _get_long_description():
    path = os.path.join(PATH_TO_FILE, 'README.rst')
    fo = open(path)
    try:
        return fo.read()
    finally:
        fo.close()

PATH_TO_FILE = os.path.dirname(__file__)
VERSION = _get_version()
LONG_DESCRIPTION = _get_long_description()
INSTALL_REQUIRES = [
    'requests==0.10.2',
]


setup(
    name='balanced',
    version=VERSION,
    url='https://balancedpayments.com/',
    license='BSD',
    author='Mahmoud Abdelkader',
    author_email='devsupport@poundpay.com',
    description='Payments platform for marketplaces',
    long_description=LONG_DESCRIPTION,
    packages=['balanced'],
    test_suite='nose.collector',
    install_requires=INSTALL_REQUIRES,
    classifiers=[
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Programming Language :: Python',
        'Topic :: Software Development :: Libraries :: Python Modules',
        ],
    )
