"""pretty much ripped off from Werkzeug with logic to hack around MultiDict

Copyright: (c) 2011 by the Werkzeug Team.

"""
import base64
import hashlib
import hmac
import inspect


def iter_multi_items(mapping):
    """Iterates over the items of a mapping yielding keys and values
    without dropping any from more complex structures.

    """
    # do this hack to avoid importing MultiDict from werkzeug
    # -- mahmoud
    if hasattr(mapping, 'iteritems'):
        try:
            argspec = inspect.getargspec(mapping.iteritems)
        except TypeError:
            if isinstance(mapping, dict):
                for key, value in mapping.iteritems():
                    if isinstance(value, (tuple, list)):
                        for value in value:
                            yield key, value
                    else:
                        yield key, value
        else:
            if 'multi' in argspec.args:
                for item in mapping.iteritems(multi=True):
                    yield item
    else:
        for item in mapping:
            yield item


#: list of characters that are always safe in URLs.
_always_safe = ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                'abcdefghijklmnopqrstuvwxyz'
                '0123456789_.-')
_safe_map = dict((c, c) for c in _always_safe)
for i in xrange(0x80):
    c = chr(i)
    if c not in _safe_map:
        _safe_map[c] = '%%%02X' % i
_safe_map.update((chr(i), '%%%02X' % i) for i in xrange(0x80, 0x100))
_safemaps = {}


def _quote(s, safe='/', _join=''.join):
    assert isinstance(s, str), 'quote only works on bytes'
    if not s or not s.rstrip(_always_safe + safe):
        return s
    try:
        quoter = _safemaps[safe]
    except KeyError:
        safe_map = _safe_map.copy()
        safe_map.update([(c, c) for c in safe])
        _safemaps[safe] = quoter = safe_map.__getitem__
    return _join(map(quoter, s))


def _quote_plus(s, safe=''):
    if ' ' in s:
        return _quote(s, safe + ' ').replace(' ', '+')
    return _quote(s, safe)


def url_encode(obj, charset='utf-8', encode_keys=False, sort=False, key=None,
               separator='&'):
    """URL encode a dict/`MultiDict`.  If a value is `None` it will not appear
    in the result string.  Per default only values are encoded into the target
    charset strings.  If `encode_keys` is set to ``True`` unicode keys are
    supported too.

    If `sort` is set to `True` the items are sorted by `key` or the default
    sorting algorithm.

    .. versionadded:: 0.5
        `sort`, `key`, and `separator` were added.

    :param obj: the object to encode into a query string.
    :param charset: the charset of the query string.
    :param encode_keys: set to `True` if you have unicode keys.
    :param sort: set to `True` if you want parameters to be sorted by `key`.
    :param separator: the separator to be used for the pairs.
    :param key: an optional function to be used for sorting.  For more details
                check out the :func:`sorted` documentation.
    """
    iterable = iter_multi_items(obj)
    if sort:
        iterable = sorted(iterable, key=key)
    tmp = []
    for key, value in iterable:
        if value is None:
            continue
        if encode_keys and isinstance(key, unicode):
            key = key.encode(charset)
        else:
            key = str(key)
        if isinstance(value, unicode):
            value = value.encode(charset)
        else:
            value = str(value)
        tmp.append('%s=%s' % (_quote(key),
                              _quote_plus(value)))
    return separator.join(tmp)


def calculate_callback_signature(url, auh_token, params={}):
    """Calculates the expected signature for a callback based on
    the callback url, developer auth token and request parameters.

    :param url: the callback url.
    :param auth_token: your developer auth token.
    :param params: parameters passed to your callback url as a dictionary.
    """
    data = url
    for key in sorted(params.keys()):
        data += '{0}{1}'.format(key, params[key])
    signature = hmac.new(auh_token, data, hashlib.sha1).digest()
    return base64.b64encode(signature)


class _Missing(object):

    def __repr__(self):
        return 'no value'

    def __reduce__(self):
        return '_missing'

_missing = _Missing()


class cached_property(object):
    """A decorator that converts a function into a lazy property.  The
    function wrapped is called the first time to retrieve the result
    and then that calculated result is used the next time you access
    the value::

        class Foo(object):

            @cached_property
            def foo(self):
                # calculate something important here
                return 42

    The class has to have a `__dict__` in order for this property to
    work.

    .. versionchanged:: 0.6
       the `writeable` attribute and parameter was deprecated.  If a
       cached property is writeable or not has to be documented now.
       For performance reasons the implementation does not honor the
       writeable setting and will always make the property writeable.
    """

    # implementation detail: this property is implemented as non-data
    # descriptor.  non-data descriptors are only invoked if there is
    # no entry with the same name in the instance's __dict__.
    # this allows us to completely get rid of the access function call
    # overhead.  If one choses to invoke __get__ by hand the property
    # will still work as expected because the lookup logic is replicated
    # in __get__ for manual invocation.

    def __init__(self, func, name=None, doc=None):
        self.__name__ = name or func.__name__
        self.__module__ = func.__module__
        self.__doc__ = doc or func.__doc__
        self.func = func

    def __get__(self, obj, type=None):
        if obj is None:
            return self
        value = obj.__dict__.get(self.__name__, _missing)
        if value is _missing:
            value = self.func(obj)
            obj.__dict__[self.__name__] = value
        return value


class ClassPropertyDescriptor(object):

    def __init__(self, fget, fset=None):
        self.fget = fget
        self.fset = fset

    def __get__(self, obj, klass=None):
        if klass is None:
            klass = type(obj)
        return self.fget.__get__(obj, klass)()

    def __set__(self, obj, value):
        if not self.fset:
            raise AttributeError("can't set attribute")
        type_ = type(obj)
        return self.fset.__get__(obj, type_)(value)

    def setter(self, func):
        if not isinstance(func, (classmethod, staticmethod)):
            func = classmethod(func)
        self.fset = func
        return self


def classproperty(func):
    if not isinstance(func, (classmethod, staticmethod)):
        func = classmethod(func)

    return ClassPropertyDescriptor(func)
