from __future__ import unicode_literals

import httplib

import wac


class BalancedError(Exception):

    def __str__(self):
        attrs = ', '.join([
            '{0}={1}'.format(k, repr(v))
            for k, v in self.__dict__.iteritems()
        ])
        return '{0}({1})'.format(self.__class__.__name__, attrs)


class ResourceError(BalancedError):
    pass


class NoResultFound(BalancedError):
    pass


class MultipleResultsFound(BalancedError):
    pass


class FundingSourceNotCreditable(Exception):
    pass


def convert_error(ex):
    if not hasattr(ex.response, 'data'):
        return ex
    return HTTPError.from_response(**ex.response.data)(ex)


class HTTPError(BalancedError, wac.Error):

    class __metaclass__(type):

        def __new__(meta_cls, name, bases, dikt):
            cls = type.__new__(meta_cls, name, bases, dikt)
            cls.types = [
                getattr(cls, k)
                for k in dir(cls)
                if k.isupper() and isinstance(getattr(cls, k), basestring)
            ]
            cls.type_to_error.update(zip(cls.types, [cls] * len(cls.types)))
            return cls

    def __init__(self, requests_ex):
        super(wac.Error, self).__init__(requests_ex)
        self.status_code = requests_ex.response.status_code
        data = getattr(requests_ex.response, 'data', {})
        for k, v in data.get('errors', [{}])[0].iteritems():
            setattr(self, k, v)

    @classmethod
    def format_message(cls, requests_ex):
        data = getattr(requests_ex.response, 'data', {})
        status = httplib.responses[requests_ex.response.status_code]
        error = data['errors'][0]
        status = error.pop('status', status)
        status_code = error.pop('status_code',
                                requests_ex.response.status_code)
        desc = error.pop('description', None)
        message = ': '.join(str(v) for v in [status, status_code, desc] if v)
        return message

    @classmethod
    def from_response(cls, **data):
        try:
            err = data['errors'][0]
            exc = cls.type_to_error.get(err['category_code'], HTTPError)
        except:
            exc = HTTPError
        return exc

    type_to_error = {}


class FundingInstrumentVerificationFailure(HTTPError):
    pass


class BankAccountVerificationFailure(FundingInstrumentVerificationFailure):
    AUTH_NOT_PENDING = 'bank-account-authentication-not-pending'
    AUTH_FAILED = 'bank-account-authentication-failed'
    AUTH_DUPLICATED = 'bank-account-authentication-already-exists'
